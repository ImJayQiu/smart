class ImportVisa
	include CSVImporter

	model Visa 

	column :passport, required: true
	column :due, required: true

end
