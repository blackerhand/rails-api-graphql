module GraphQL
  class ExecutionError
    def code
      406
    end
  end
end
#
# module GraphQL
#   class Schema
#     class Member
#       # DSL methods shared by lots of things in the GraphQL Schema.
#       # @api private
#       # @see Classes that extend this, eg {GraphQL::Schema::Object}
#       module BaseDSLMethods
#         alias_method :old_default_graphql_name, :default_graphql_name
#
#         def default_graphql_name
#           if self.name.to_s.include?('Inputs')
#             self.name.to_s.sub("Inputs", "").gsub("::", "")
#           elsif self.name.to_s.include?('Mutations')
#             self.name.to_s.sub("Mutations", "").gsub("::", "")
#           else
#             old_default_graphql_name
#           end
#         end
#       end
#     end
#   end
# end

#
# module GraphQL
#   class Schema
#     # Subclasses of this can influence how {GraphQL::Execution::Interpreter} runs queries.
#     #
#     # - {.include?}: if it returns `false`, the field or fragment will be skipped altogether, as if it were absent
#     # - {.resolve}: Wraps field resolution (so it should call `yield` to continue)
#     class Directive < GraphQL::Schema::Member
#       extend GraphQL::Schema::Member::HasArguments
#
#       class << self
#         def default_graphql_name
#           puts name
#           puts 'yyyy' * 20
#
#           self.name.split('::')[1..-1].join('').camelize(:lower)
#         end
#       end
#
#     end
#   end
# end
