task :gen_pdf do
  puts 'gen_pdf start'

  # Implicit Block
  Prawn::Document.generate('./lib/tasks/implicit.pdf') do
    font_families["msyh"] = { :normal => { :file => Rails.root.join('lib', 'tasks', 'msyh.ttf') }, :bold => { :file => Rails.root.join('lib', 'tasks', 'msyh.ttf') } }
    font("msyh")

    stroke_axis

    # text 'Hello World'

    # stroke_circle [0, 0], 10
    #
    # bounding_box([100, 300], width: 300, height: 200) do
    #   stroke_bounds
    #   stroke_circle [0, 0], 10
    # end

    #
    # text "the cursor is here: #{cursor}"
    # text "now it is here: #{cursor}"
    #
    # move_down 200
    # text "on the first move the cursor went down to: #{cursor}"
    #
    # move_up 100
    # text "on the second move the cursor went up to: #{cursor}"
    #
    # move_cursor_to 50
    # text "on the last move the cursor went directly to: #{cursor}"


    # stroke_horizontal_rule
    # pad(20) { text 'Text padded both before and after.' }
    # stroke_horizontal_rule

    # pad_top(20) { text 'Text padded on the top.' }
    # stroke_horizontal_rule
    #
    # pad_bottom(20) { text 'Text padded on the bottom.' }
    # stroke_horizontal_rule
    # move_down 30
    # text 'Text written before the float block.'
    #
    # float do
    #   move_down 30
    #   bounding_box([10, cursor], width: 200) do
    #     text 'Text written inside the float block.'
    #     stroke_bounds
    #   end
    # end
    # text 'Text written after the float block.'
    # start_new_page
    # text 'Text written after the float block.'

    # stroke_axis
    #
    # # No block
    # line [0, 200], [100, 150]
    # stroke
    #
    # rectangle [0, 100], 5, 50
    # fill
    #
    # # With block
    # stroke { line [200, 200], [300, 150] }
    # fill { rectangle [200, 100], 100, 100 }
    #
    # # Method hook
    # stroke_line [400, 200], [500, 150]
    # fill_rectangle [400, 100], 100, 100
    # text 'The image will go right below this line of text.'

    size_x = 535
    size_y = 700

    image_dir    = Rails.root.join('lib', 'tasks', 'images')
    outline_meta = []

    Dir.new(image_dir).select { |f| f.match(/(png|jpg)\z/) }.sort.each_with_index do |file, i|
      bounding_box([0, cursor - 10], width: size_x, height: size_y) do
        image image_dir.join(file),
              fit:      [size_x, size_y],
              position: :center, vposition: :center

        stroke_bounds if i == 0
      end


      page_number = i + 1
      sections    = file.gsub('*', '').split('.')[0].split('_')[1..-1]

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

      start_new_page if page_number != Dir.new(image_dir).select { |f| f.match(/(png|jpg)\z/) }.length
    end


    # outline.define do
    #   page title: file, destination: (i + 1)
    # end


    # outline_meta = [
    #   { name: '第一部',
    #     to:   1,
    #     son:  [
    #             {
    #               name: '第一章',
    #               to:   1,
    #               son:  [
    #                       {
    #                         name: '第一节',
    #                         to:   1,
    #                       },
    #                       {
    #                         name: '第二节',
    #                         to:   2,
    #                       }
    #                     ],
    #
    #             },
    #             {
    #               name: '第二章',
    #               to:   3,
    #             },
    #             {
    #               name: '第三章',
    #               to:   4,
    #               son:  [
    #                       {
    #                         name: '第一节',
    #                         to:   4,
    #                       }
    #                     ]
    #             },
    #           ]
    #   },
    #   {
    #     name: '第二部',
    #     to:   5,
    #     son:  [
    #             {
    #               name: '第一章',
    #               to:   6,
    #               son:  [
    #                       {
    #                         name: '第一节',
    #                         to:   6,
    #                       },
    #                       {
    #                         name: '第二节',
    #                         to:   7,
    #                       }
    #                     ],
    #
    #             },
    #           ]
    #   },
    # ]

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

      # section('Section 1', destination: 1) do
      #   page title: 'Page 2', destination: 1
      #   page title: 'Page 3', destination: 3
      # end
      #
      # section('Section 2', destination: 4) do
      #   page title: 'Page 5', destination: 5
      #
      #   section('Subsection 2.1', destination: 6, closed: true) do
      #     page title: 'Page 7', destination: 7
      #   end
      # end
    end

    # # First we create 10 pages just to have something to link to
    # (1..10).each do |index|
    #   text "Page #{index}"
    #   start_new_page
    # end
    #
    # outline.define do
    #   page title: '第二页', destination: 2
    #   page title: '第三页', destination: 3
    # end

    number_pages '第 <page> 页', {
      at:    [bounds.right - 415, -5],
      width: 150,
      align: :right,
      size:  10
    }

    # Gray page numbers from 8 on up
    # options[:page_filter] = ->(pg) { pg > 7 }
    # options[:start_count_at] = 8
    # options[:color] = '333333'

    # number_pages string, options
    #
    # start_new_page
    # text "See. This page isn't numbered and doesn't count towards the total."
  end

  puts 'gen_pdf end'
end

