class GraphqlPolicy
  RULES = {
    Types::QueryType => {
      current_user: ->(obj, args, ctx) { ctx[:current_user].present? }
    }
  }

  def self.guard(type, field)
    type.introspection? ? ->(_obj, _args, _ctx) { true } : RULES.dig(type, field)
  end
end
