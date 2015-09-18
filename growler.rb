require 'sinatra'
require 'sinatra/reloader'

before do |variable|
	
end

# Routes
get '/' do
	erb :index
end
