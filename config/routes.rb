Rails.application.routes.draw do
  post 'pdf/uploads', to: 'application#uploads'

  post "/graphql", to: "graphql#execute"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
end
