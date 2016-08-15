class ImportUser
	include CSVImporter

	model User


	column :code, required: true
	column :name, required: true
	column :gender, required: true
	column :major, required: true
	column :enroll, required: true
	column :passport, required: true
	column :role, required: true

	column :country
	column :province
	column :city

	after_build do |user|
		user.email = user.code + "@dpu-caic.edu"
		user.password = user.passport
	end

end
