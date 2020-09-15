class RailsApiGraphqlSchema < GraphQL::Schema
  extend MessageHelper

  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections
  use GraphQL::Execution::Errors

  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Guard.new(policy_object: GraphqlPolicy)

  def self.id_from_object(object, type_definition, _query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.graphql_name, object.id)
  end

  def self.object_from_id(id, _query_ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    type_name.safe_constantize.find(item_id)
  end

  def self.resolve_type(_type, obj, _ctx)
    "Models::#{obj.class}Type".safe_constantize || raise("Unexpected object: #{obj}")
  end

  rescue_from(ActiveRecord::RecordNotFound) do |err, _obj, _args, _ctx, _field|
    raise NotFoundError, [err.message, { model_name: err.model }]
  end

  rescue_from(ActiveRecord::RecordInvalid) do |err, _obj, _args, _ctx, _field|
    raise NotValidError, err.message
  end

  rescue_from(GraphQL::Guard::NotAuthorizedError) do |err, obj, args, ctx, field|
    raise NotValidError, build_message(err, obj, args, ctx, field)
  end
end
