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
	growl = params[:growl]
	url = "/invalid_growl"
	if growl.length <= 142
		session[:roars] << params[:growl]
		session[:time_stamp] << Time.now.strftime("%m/%d/%Y %H:%M %p")
	else redirect_to url
end

get '/view_growls' do 
	array_length = session[:roars].length
	roars = session[:roars]
	times = session[:time_stamp]
	for i in 0..array_length
		p (i+1)
		p "     "
		puts times[i]
		puts roars[i]
	end
end


