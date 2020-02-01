require 'net/http'
require 'uri'
require 'json'

module Lib
	class FetchSymbol
		API_KEY = ENV.fetch("QUANDL_API_KEY")
		@@url = "https://www.quandl.com"

		def self.symbols
			response = []
			reader = CSV.table("FSE_metadata.csv")
			reader.each do |row|
				response << {
					"code": row[0],
					"name": row[1],
					"description": row[2],
					"refreshed_at": row[3],
					"from_date": row[4],
					"to_date": row[5]
				}
			end
		 	response
		end

		def self.ticker_price(symbol_code)
			get_path = "/api/v3/datasets/FSE/#{symbol_code}/data.json?api_key=#{API_KEY}"
			uri = URI(@@url + get_path)
			response = nil

			puts uri
			Net::HTTP.start(uri.host, uri.port, {use_ssl: true}) do |http|
				response = self.follow_redirect(uri)
			end
			response_data = JSON.parse response.body
			byebug
			data = response_data['dataset_data']['data']
			parsed_data = []
			data.each do |row|
				parsed_data << {
					"open" => row[1],
					"high" => row[2],
					"low" => row[3],
					"close" => row[4]
				}
			end
			return parsed_data
		end

		def self.follow_redirect(uri_str, limit = 3)
			raise ArgumentError, 'too many HTTP redirects' if limit == 0

			response = Net::HTTP.get_response(URI(uri_str))

			case response
			when Net::HTTPSuccess then
			  response
			when Net::HTTPRedirection then
			  location = response['location']
			  warn "redirected to #{location}"
			  self.follow_redirect(location, limit - 1)
			else
			  response.value
			end
		  end
	end
end
