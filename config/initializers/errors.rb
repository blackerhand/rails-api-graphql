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

class UnauthorizedError < GraphQL::ExecutionError
  def code
    401
  end
end

class SignError < UnauthorizedError; end

class ForbiddenError < GraphQL::ExecutionError
  def code
    403
  end
end

class NotFoundError < GraphQL::ExecutionError
  def code
    404
  end
end

class NotValidError < GraphQL::ExecutionError
  def code
    404
  end
end

class NotAllowError < GraphQL::ExecutionError
  def code
    409
  end
end

class OtherError < GraphQL::ExecutionError
  def code
    422
  end
end

module GraphQL
  class Query
    class VariableValidationError
      def node_name
        ast_node.type.of_type.name
      end

      def model_class
        node_name.underscore.split('_').first
      end

      def i18n_path(path)
        return I18n.t("activerecord.models.#{model_class}") if path.blank?

        I18n.t("activerecord.attributes.#{model_class}.#{path}")
      end

      def i18n_explanation(explanation)
        I18n.t("errors.messages.#{explanation.gsub(' ', '_').downcase}")
      end

      def i18n_problem(problem)
        return if problem['path'].blank? && problem['explanation'].blank?

        "#{i18n_path(problem['path'].first)}#{i18n_explanation(problem['explanation'])}"
      end

      def i18n_message
        validation_result.problems.map { |problem| i18n_problem(problem) }.join(',')
      end
    end
  end

  class ExecutionError
    alias_method :old_to_h, :to_h

    def i18n_message
      I18n.t("errors.messages.#{message}", default: message)
    end

    def to_h
      old_to_h.merge(code:         code,
                     i18n_message: i18n_message,
                     class:        self.class.to_s)
    end
  end
end
