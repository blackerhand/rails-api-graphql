module GraphQL_API
  JWT_EXP     = ENV['JWT_EXP'].to_i
  JWT_REFRESH = ENV['JWT_EXP'].to_i / 2

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  PER_PAGE   = 15
  SEARCH_PER = 10

  NOT_REQUIRE_LOGIN = %w[post_users_sign_in]
end
