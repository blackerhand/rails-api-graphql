class GraphqlPolicy
  RULES = {
    Types::QueryType    => {
      currentUser: ->(obj, args, ctx) { ctx[:current_user].present? }
    },
    Types::MutationType => {
      createPost: ->(obj, args, ctx) { ctx[:current_user].present? }
    }
  }

  def self.guard(type, field)
    type.introspection? ? ->(_obj, _args, _ctx) { true } : RULES.dig(type, field)
  end
end
