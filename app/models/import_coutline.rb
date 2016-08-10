class ImportCoutline

	include CSVImporter

	model Coutline 

	column :code, required: true
	column :name, required: true
	column :major, required: true
	column :ctype, required: true

	when_invalid :abort

end
