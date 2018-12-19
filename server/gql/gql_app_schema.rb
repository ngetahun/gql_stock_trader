require 'graphql'
require_relative 'types/query'
class GqlAppSchema < GraphQL::Schema
    query Types::Query
    # subscription
end
