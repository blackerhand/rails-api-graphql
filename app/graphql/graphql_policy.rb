class GraphqlPolicy
  RULES = {
    Types::QueryType    => {
      currentUser: ->(obj, args, ctx) { ctx[:current_user].present? }
    },
    Types::MutationType => {
      createPost: ->(obj, args, ctx) { ctx[:current_user].present? },
      updatePost: ->(obj, args, ctx) { args[:node].owner == ctx[:current_user] }
    }
  }

  def self.guard(type, field)
    type.introspection? ? ->(_obj, _args, _ctx) { true } : RULES.dig(type, field)
  end
end
