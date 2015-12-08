post '/posts/:postid/book' do

	book = Booking.new(booking: 1, user_id: session[:user_id], post_id: params[:postid])
	
	if !book.user_id.nil?	
		book_id = Booking.find_by(user_id: session[:user_id])
		booked = Booking.find_by(booking: 1, post_id: params[:postid])

		if book_id.nil?

			book.save
			flash[:success] = "Congratulation, you have made a booking."

		elsif book.user_id == booked.user_id

			book_id.destroy
			flash[:cancel] = "Booking cancel"

		end

	elsif booked.status == 1
			bookings = Booking.find_by(user_id: session[:user_id])
			bookings.destroy
			flash[:booked] = "Too Bad, Property unavailable at the moment."
	end
		redirect "/posts/#{params[:postid]}"
end