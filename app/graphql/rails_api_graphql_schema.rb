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
    not_authorized: ->(type, field) do
      ForbiddenError.new("不允许访问 #{type}.#{field}")
    end
  )

  rescue_from(ActiveRecord::RecordNotFound) do |err, obj, args, ctx, field|
    raise NotFoundError, "#{I18n.t("activerecord.models.#{err.model.underscore}")}不存在"
  end

  rescue_from(ActiveRecord::RecordInvalid) do |err, obj, args, ctx, field|
    raise NotValidError, err.message
  end

  rescue_from(GraphQL::Guard::NotAuthorizedError) do |err, obj, args, ctx, field|
    raise UnauthorizedError, err.message
  end
end
