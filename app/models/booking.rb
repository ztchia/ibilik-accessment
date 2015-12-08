class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :post
	belongs_to :user
end