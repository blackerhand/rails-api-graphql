module GraphQL
  class ExecutionError
    attr_accessor :field_name, :model_name, :format

    def code
      406
    end

    alias_method :old_to_h, :to_h

    def to_h
      old_to_h.merge(code:         code,
                     i18n_message: i18n_message,
                     field_name:   field_name,
                     model_name:   model_name,
                     class:        self.class.to_s)
    end

    def default_format
      self.class.to_s.underscore
    end

    def format_field_name(field_name)
      return if field_name.blank?

      field_name.to_s.underscore
    end

    def format_model_name(model_name)
      return if model_name.blank?

      model_name.split('::').last.gsub(/(Type|Input)/, '').underscore
    end

    def i18n_name
      return if model_name.blank?

      if model_name.match(/(query|mutation)/)
        I18n.t_graphql(field_name)
      else
        I18n.t_activerecord(model_name, field_name)
      end
    end

    def i18n_message
      return if format.nil?

      I18n.t_explanation(format, field: i18n_name)
    end
  end

  class Query
    class VariableValidationError
      def i18n_problem(problem)
        return if problem['path'].blank? && problem['explanation'].blank?

        path_name = problem['path'].map { |path| I18n.t_activerecord(model_name, path) }
        problem.merge!(i18n_path: path_name)

        explanation_name = I18n.t_explanation(problem['explanation'])
        problem.merge!(i18n_explanation: explanation_name)

        "#{path_name.join(',')} #{explanation_name}"
      end

      def i18n_message
        @model_name ||= ast_node.type.of_type.name.split('_').first.underscore
        return if @model_name.blank?

        validation_result.problems.map { |problem| i18n_problem(problem) }.join(',')
      end
    end
  end
end

class I18nMessage < GraphQL::ExecutionError
  def initialize(message, ast_node: nil, options: nil, extensions: nil)
    if message.is_a?(Array)
      @other_message = message[1].dup

      @field_name = format_field_name(message[1].delete(:field_name))
      @model_name = format_model_name(message[1].delete(:model_name))
      @format     = message[1].delete(:format) || default_format

      message = message[0]
    end

    super
  end
end

class UnauthorizedError < I18nMessage
  def code
    401
  end
end

class SignError < I18nMessage; end

class ForbiddenError < I18nMessage
  def code
    403
  end
end

class NotFoundError < I18nMessage
  def code
    404
  end
end

class NotValidError < I18nMessage
  def code
    404
  end
end

class NotAllowError < I18nMessage
  def code
    409
  end
end

class OtherError < I18nMessage
  def code
    422
  end
end

# class PermissionDeniedError < StandardError; end
#
# class RecordStateError < StandardError; end
#
# class RecordAlreadyDisabled < StandardError; end
#
# class RecordNotAllowDisabled < StandardError; end
#
# class RecordCheckInvalid < StandardError; end
#
# class SearchError < StandardError; end
#
