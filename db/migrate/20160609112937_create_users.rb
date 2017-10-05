class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :code
			t.string :sname
			t.string :fname
			t.string :gender
			t.string :research
			t.string :department
			t.date :birthday
			t.date :enroll
			t.string :city
			t.string :province
			t.string :country
			t.string :role
			t.string :phone
			t.string :address
			t.text :des

			t.timestamps null: false
		end
	end
end
