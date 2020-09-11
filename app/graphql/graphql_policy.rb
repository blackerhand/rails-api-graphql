class GraphqlPolicy
  RULES = {
    Types::QueryType    => {
      currentUser: ->(obj, args, ctx) { ctx[:current_user].present? }
    },
    Types::MutationType => {
      createPost: ->(obj, args, ctx) { ctx[:current_user].present? },
      updatePost: ->(obj, args, ctx) { ctx[:a] = 1 || true }
    }
  }

  def self.guard(type, field)
    type.introspection? ? ->(_obj, _args, _ctx) { true } : RULES.dig(type, field)
  end
end
