class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    variables      = prepare_variables(params[:variables])
    query          = params[:query]
    operation_name = params[:operationName]
    context        = { current_user: current_user }

    result = RailsApiGraphqlSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    handle_error e
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    error_info =
      case e
      when Svc::JwtSignature::SignError
        { i18n_message: '登录失败', code: 401 }
      else
        render json: { errors: [{ message: '系统异常, 请稍后重试' }], data: {} }, status: 500 and return unless Rails.env.development?
      end

    result = { errors: [{ message: e.message, backtrace: e.backtrace, class: e.class.to_s }.merge(error_info || {})], data: {} }
    render json: result, status: 200
  end
end
