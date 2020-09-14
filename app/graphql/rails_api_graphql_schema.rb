class RailsApiGraphqlSchema < GraphQL::Schema
  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections
  use GraphQL::Execution::Errors

  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Guard.new(
    policy_object:  GraphqlPolicy,
    not_authorized: lambda do |type, field|
      ForbiddenError.new("不允许访问 #{type}.#{field}")
    end
  )

  rescue_from(ActiveRecord::RecordNotFound) do |err, _obj, _args, _ctx, _field|
    raise NotFoundError, "#{I18n.t("activerecord.models.#{err.model.underscore}")}不存在"
  end

  rescue_from(ActiveRecord::RecordInvalid) do |err, _obj, _args, _ctx, _field|
    raise NotValidError, err.message
  end

  def self.id_from_object(object, type_definition, _query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.graphql_name, object.id)
  end

  def self.object_from_id(id, _query_ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    type_name.safe_constantize.find(item_id)
  end

  def self.resolve_type(_type, obj, _ctx)
    "Types::#{obj.class}Type".safe_constantize || raise("Unexpected object: #{obj}")
  end
end
