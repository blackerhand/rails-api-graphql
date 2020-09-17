module Svc
  class PdfGenerate < Svc::Base
    attr_accessor :files, :opts

    def initialize(files, opts = {})
      @files = files.sort { |a, b| a.original_filename <=> b.original_filename }
      @opts  = {
        size_x: 535,
        size_y: 700
      }
    end

    def call
      files = @files
      opts  = @opts
      outline_meta = []

      Prawn::Document.generate(Rails.root.join('public', 'result.pdf')) do
        font_families["msyh"] = {
          normal: { file: Rails.root.join('lib', 'tasks', 'msyh.ttf') },
          bold:   { file: Rails.root.join('lib', 'tasks', 'msyh.ttf') }
        }

        font("msyh")

        # stroke_axis

        files.each_with_index do |file, i|
          bounding_box([0, cursor - 10], width: opts[:size_x], height: opts[:size_y]) do
            image file.tempfile,
                  fit:      [opts[:size_x], opts[:size_y]],
                  position: :center, vposition: :center

            # stroke_bounds if i == 0

            page_number = i + 1
            sections    = file.original_filename.gsub('*', '').split('.')[0].split('_')[1..-1]

            sections.each do |se|
              i  = se[0].to_i - 1
              se = se[1..-1]

              if i == 0
                next if se.blank?

                outline_meta.push({
                                    name: se,
                                    to:   page_number
                                  })
              elsif i == 1
                next if se.blank?

                outline_meta.last[:son] ||= []
                outline_meta.last[:son].push({
                                               name: se,
                                               to:   page_number
                                             })
              else
                next if se.blank?

                outline_meta.last[:son].last[:son] ||= []
                outline_meta.last[:son].last[:son].push({
                                                          name: se,
                                                          to:   page_number
                                                        })
              end
            end
          end

          start_new_page if page_number != files.length
        end

        outline.define do
          outline_meta.each do |ele|
            if ele[:son].blank?
              page title: ele[:name], destination: ele[:to]
            else
              section(ele[:name], destination: ele[:to]) do
                ele[:son].each do |sele|
                  if sele[:son].blank?
                    page title: sele[:name], destination: sele[:to]
                  else
                    section(sele[:name], destination: sele[:to]) do
                      sele[:son].each do |ssele|
                        page title: ssele[:name], destination: ssele[:to]
                      end
                    end
                  end
                end
              end
            end
          end
        end

        number_pages '第 <page> 页', {
          at:    [bounds.right - 415, -5],
          width: 150,
          align: :right,
          size:  10
        }
      end
    end
  end
end
