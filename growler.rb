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

post '/' do
	erb :add_growl
	if logic (length of growl <=142)
	session[:roars] << params[:growl]
	session[:time_stamp] << Time.now.strftime("%m/%d/%Y %H:%M %p")
	else redirect to invalid page
end

