module GraphQL
  module Types
    module Relay
      class PageInfo
        field :total_count, Integer, null: false, description: "Total items count"

        def total_count
          object.items.size
        end
      end
    end
  end
end
