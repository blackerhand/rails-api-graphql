class GraphqlPolicy
  include PolicyHelper

  RULES = {
    Types::QueryType    => {
      userCurrent:    ->(_obj, args, ctx) { login_required!(args, ctx) },
      userList:       ->(_obj, args, ctx) { login_required!(args, ctx) },
    },
    Types::MutationType => {
      userSignIn:        ->(_obj, _args, _ctx) { true },
      userSignUp:        ->(_obj, _args, _ctx) { true },
      userUpdate:        ->(_obj, args, ctx) { login_required!(args, ctx) },
    },
    Models::UserType    => {
      token: ->(obj, _args, ctx) { obj.try(:object) == ctx[:current_user] }
    },
  }.freeze

  def self.guard(type, field)
    type.introspection? ? ->(_obj, _args, _ctx) { true } : RULES.dig(type, field)
  end
end
