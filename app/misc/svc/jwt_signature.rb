module Svc
  module JwtSignature
    class SignError < StandardError
    end

    module_function

    # rubocop:disable Style/RescueStandardError
    def verify!(token)
      token = token.gsub(/^Bearer /, '') if token.to_s.start_with?('Bearer ')
      JWT.decode token, ENV['JWT_SECRET'], true, algorithm: 'HS256'
    rescue => e
      raise SignError, e.message
    end

    def sign(payload)
      payload['exp'] = Time.current.to_i + GraphQL_API::JWT_EXP
      "Bearer #{JWT.encode payload, ENV['JWT_SECRET'], 'HS256'}"
    end

    def refresh!(payload)
      sign(payload) if payload['exp'] - Time.current.to_i < GraphQL_API::JWT_REFRESH
    end

    # rubocop:enable Style/RescueStandardError
  end
end
