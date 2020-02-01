require_relative "../base_input_object"
module Types
	module Inputs
		class SymbolDataInput < ::Types::BaseInputObject
			argument :symbol_data, String, "Symbol Data", required: true
			argument :from_date, GraphQL::Types::ISO8601DateTime, "Start Date", required: true
			argument :end_date, GraphQL::Types::ISO8601DateTime, "End Date", required: false
		end
	end
end
