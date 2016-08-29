class ImportEnrollcourse
	include CSVImporter

	model Enrollcourse 

	column :code, required: true
	column :ccode, required: true

end
