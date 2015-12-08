# New posting form
get '/posts/new' do
	erb :"post/new"
end

#Fill in posting form details 

post '/posts' do
	# flash[:error] = "Please login before we proceed."
	# redirect to "/posts/new"
	post = Post.create(location: params[:location], title: params[:title], 
		description: params[:description], extras: params[:extras], 
		preference: params[:preference], monthly_rental: params[:monthly_rental], user_id: session[:user_id])
	redirect "/posts/#{post.id}"

end

#Read all posting 

get '/posts/all' do

	@posts = Post.all
	erb :"post/all"

end

# View post profile

get '/posts/:id' do

	
	@user = User.all
	@posts = Post.find(params[:id])
	@comments = Comment.where(post_id: params[:post_id])
	erb :'post/show'
end

# # Update post

patch '/posts/:id' do

	post = Post.find(params[:id])


		post.update(location: params[:location], title: params[:title], 
		description: params[:description], extras: params[:extras], 
		preference: params[:preference], monthly_rental: params[:monthly_rental], user_id: session[:user_id])
		redirect "/posts/#{post.id}"
end

# Display post edit form

get '/posts/:id/edit' do
	@post = Post.find(params[:id])
	erb :'post/edit'
end 

# Delete post 

delete '/posts/:id' do
	post = Post.find(params[:id])
	post.destroy
	erb :'static/index'
	# redirect "/"
end
