module Clients
  module Concerns
    module Format
      def format_time(str)
        return if str.blank?

        Date.parse(str.gsub(/\p{Han}/, '-')).to_s rescue nil
      end

      def format_boolean(str)
        return false if ['0', 0, false, 'false', 'N'].include?(str)
        return true if ['1', 1, true, 'true', 'Y'].include?(str)

        nil
      end
    end
  end
end
