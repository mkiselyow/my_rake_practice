require "./lib/greeter.rb"

use Rack::Reloader

run Greeter.new