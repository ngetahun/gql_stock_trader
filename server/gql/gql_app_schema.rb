require 'graphql'
require_relative 'types/query'
require_relative 'types/subscriptions'
class GqlAppSchema < GraphQL::Schema
    query Types::Query
    subscription Types::Subscriptions
end
