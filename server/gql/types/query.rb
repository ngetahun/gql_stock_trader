require 'graphql'
module Types
    class Query < GraphQL::Schema::Object
        graphql_name 'RootQuery'
        field :ping, String, description: 'Ping query', null: false
        def ping
          'pong'
        end
    end
end
