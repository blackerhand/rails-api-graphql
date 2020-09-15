class GraphqlPolicy
  RULES = {
    Types::QueryType    => {
      userCurrent: ->(_obj, _args, ctx) { ctx[:current_user].present? }
    },
    Types::MutationType => {
      postCreate: ->(_obj, _args, ctx) { ctx[:current_user].present? },
      postUpdate: ->(_obj, args, ctx) { args[:node].owner == ctx[:current_user] }
    },
    Models::UserType    => {
      token: ->(obj, _args, ctx) { obj.try(:object) == ctx[:current_user] }
    },
  }.freeze

  def self.guard(type, field)
    type.introspection? ? ->(_obj, _args, _ctx) { true } : RULES.dig(type, field)
  end
end
