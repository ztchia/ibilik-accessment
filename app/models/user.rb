class User < ActiveRecord::Base
	validates :email, uniqueness: true
	has_many :posts, :dependent => :destroy 
	has_many :comments
	has_secure_password
end