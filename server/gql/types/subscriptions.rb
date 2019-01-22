require 'graphql'
require_relative 'base_object'

module Types
  class Subscriptions < Types::BaseObject
    field :test_subscription, String, null: false
    def test_subscription
      'test response from subs'
    end

    field :get_current_ticker_price, String, null: false
    def get_current_ticker_price
      ''
    end

  end
end
