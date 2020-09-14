class GraphqlPolicy
  RULES = {
    Types::QueryType => {
      currentUser: ->(_obj, _args, ctx) { ctx[:current_user].present? }
    },
    Types::MutationType => {
      createPost: ->(_obj, _args, ctx) { ctx[:current_user].present? },
      updatePost: ->(_obj, args, ctx) { args[:node].owner == ctx[:current_user] }
    }
  }.freeze

  def self.guard(type, field)
    type.introspection? ? ->(_obj, _args, _ctx) { true } : RULES.dig(type, field)
  end
end
