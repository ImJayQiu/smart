class ImportUser
	include CSVImporter

	model User

	column :code, required: true
	column :name, required: true
	column :major, required: true
	column :enroll, required: true
	column :passport, required: true
	column :email, required: true
	column :role, required: true
	column :password, required: true
	column :password_confirmation, required: true

end
