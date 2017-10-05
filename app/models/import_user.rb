class ImportUser
	include CSVImporter

	model User


	column :code, required: true
	column :fname, required: true
	column :gender, required: true
	column :department, required: true
	column :enroll, required: true
	column :research, required: true
	column :role, required: true
	column :email, required: true
	column :phone, required: true

	column :country
	column :province
	column :city

	after_build do |user|
		user.password = user.phone
	end

end
