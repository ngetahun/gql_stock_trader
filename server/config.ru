require './app'
require 'zeitwerk'
require 'listen'

loader = Zeitwerk::Loader.new
# loader.logger = method(:puts)
loader.push_dir("#{__dir__}/gql")
loader.setup
Listen.to(__dir__) { loader.reload }.start

if ENV['RACK_ENV'] == 'production'
  require 'dotenv/load'
  Zeitwerk::Loader.eager_load_all
  run App
else
  require 'dotenv/load'
  Zeitwerk::Loader.eager_load_all
  run ->(env) {
    App.call(env)
  }
end
