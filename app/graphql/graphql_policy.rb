class GraphqlPolicy
  include PolicyHelper

  RULES = {
    Types::QueryType    => {
      usersCurrent:    ->(_obj, args, ctx) { login_required!(args, ctx) },
      usersList:       ->(_obj, args, ctx) { login_required!(args, ctx) },
    },
    Types::MutationType => {
      usersSignIn:        ->(_obj, _args, _ctx) { true },
      usersSignUp:        ->(_obj, _args, _ctx) { true },
      usersUpdate:        ->(_obj, args, ctx) { login_required!(args, ctx) },
    },
    Models::UserType    => {
      token: ->(obj, _args, ctx) { obj.try(:object) == ctx[:current_user] }
    },
  }.freeze

  def self.guard(type, field)
    type.introspection? ? ->(_obj, _args, _ctx) { true } : RULES.dig(type, field)
  end
end
