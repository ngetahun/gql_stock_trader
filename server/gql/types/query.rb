require 'graphql'
require_relative 'base_object'
module Types
    class Query < Types::BaseObject
        graphql_name 'RootQuery'
        field :ping, String, description: 'Ping query', null: false
        def ping
          'pong'
        end
        field :ping, String, description: '', null: false 
    end
end
