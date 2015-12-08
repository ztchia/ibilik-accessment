
#comment create yo!!!
# post '/posts/:id/comments' do	
	
# 	@post = Post.find(params[:id])

# 	@comments = Comment.create(input: params[:input], post_id: session[:post_id], 
# 		user_id: session[:user_id] )

# 	redirect "/posts/#{@post.id}"

# end

# patch '/posts/:id/comments/edit' do

# 	Comment.update(input: params[:input])
# end