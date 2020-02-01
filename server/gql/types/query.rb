require 'graphql'
require_relative 'base_object'
require_relative 'inputs/symbol_data_input'
require_relative 'symbol_data'
require_relative '../lib/fetch_symbol'

module Types
    class Query < Types::BaseObject
        graphql_name 'RootQuery'
        field :ping, String, description: 'Ping query', null: false
        def ping
          'pong'
        end

				field :data_for_symbol, [::Types::SymbolData::Symbol] , 'Query to find the latest data for symbol' , null:false do
					argument :symbol_query, ::Types::Inputs::SymbolDataInput, required: true
				end

				def data_for_symbol(symbol_query:)
					Lib::FetchSymbol.ticker_price symbol_query.symbol_data
				end

				field :symbol_list, [::Types::SymbolData::SymbolItem], 'Fetch Symbol list data', null: false
				def symbol_list
					Lib::FetchSymbol.symbols
				end
    end
end
