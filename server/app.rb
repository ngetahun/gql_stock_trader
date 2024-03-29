require 'sinatra'
require 'sinatra/json'
require "sinatra/reloader" if development?
require 'rack'
require 'rack/contrib'
require_relative 'gql/gql_app_schema'

class App < Sinatra::Base
   get '/' do
      'it works!'  
    end

    get '/jsontest' do
        msg = {'message' => 'It works!' }
        json msg 
    end

  use Rack::PostBodyContentTypeParser
  post '/graphql' do
      result = GqlAppSchema.execute(
          params[:query],
          variables: params[:variables],
          context: { current_user: nil },
      )
      json result
  end

end
