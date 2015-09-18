require 'sinatra'
require 'sinatra/reloader'

enable :sessions

before do
	session[:roars] ||= []
	session[:time_stamp] ||= []
end

# Routes
get '/' do
	erb :index
end

get '/add_growl' do 
	# We use this view to display the form
	erb :add_growl
end

post '/add_growl' do
	
	growl = params[:growl]
	url = "/invalid_growl"
	if growl.length <= 142
		session[:roars] << params[:growl]
		session[:time_stamp] << Time.now.strftime("%m/%d/%Y %H:%M %p")
		erb :add_growl
	else 
		erb :invalid_growl
	end
	
end

get '/view_growls' do 
	@array_length = session[:roars].length
	@roars = session[:roars]
	@times = session[:time_stamp]

	erb :view_growls
end


