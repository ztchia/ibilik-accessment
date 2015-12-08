# Logout 
get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

# View login page

get '/users' do

	erb :'user/index'
	
end
# Login
post '/users/login' do

	user = User.find_by(email: params[:email])

	if user.nil?
		flash[:error] = "Invalid email!"
		redirect to "/users"
	else
		if user.authenticate(params[:password])
		   session[:user_id] = user.id
		   redirect "/users/#{user.id}"
		else

		flash[:error] = "Wrong password!"
		redirect to "/users"
	end

	end
end

#new account registration form

get '/users/new' do
	erb :'user/new'
end

#create new account 
post '/users' do
	user = User.create(name: params[:name], 
		email: params[:email], password: params[:password])
	redirect "/users/#{user.id}"
end

#display all user 
get '/users/all' do

	@users = User.all
	erb :'user/all'
end

#display user
get '/users/:id' do
	@users = User.find(params[:id])
	erb :'user/show'
end

# Display user edit form

get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'user/edit'
end 

# Update user

patch '/users/:id' do
	@user = User.find(params[:id])
	@user.update(name: params[:name], email: params[:email], password: 
		params[:password])
	redirect "/users/#{@user.id}"
end

# Delete User

delete '/users/:id' do
	user = User.find(params[:id])
	user.destroy
	erb :'static/index'
	# redirect "/"
end

