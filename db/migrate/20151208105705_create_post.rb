class CreatePost < ActiveRecord::Migration
	def change
		create_table :posts do |t|

			t.string :location
			t.string :title 
			t.text :description
			t.string :extras
			t.string :preference 
			t.string :monthly_rental
			t.integer :user_id


			t.timestamps null:false
		end
	end
end
