require_relative 'base_object'
module Types
	module SymbolData
		class Symbol < BaseObject
			description "Symbol data"
			# field :name, String, 'Symbol Name', null: false
			field :open, [Integer], "Symbol open prices", null: false
			field :high, [Integer], "Symbol high prices", null: false
			field :low, [Integer], "Symbol low prices", null: false
			field :close, [Integer], "Symbol close prices", null: false
		end

		class SymbolItem < BaseObject
			description "Symbol Description Data"
			# code,name,description,refreshed_at,from_date,to_date
			field :code, String, "Symbol code", null: false
			field :name, String, "Symol name", null: false
			field :description, String, "Symbol description", null: false
			field :refreshed_at, GraphQL::Types::ISO8601DateTime, "Symbol refreshed at", null: false
			field :from_date, GraphQL::Types::ISO8601DateTime, "Start date", null: false
			field :to_date, GraphQL::Types::ISO8601DateTime, "To date", null: false
		end
	end
end
