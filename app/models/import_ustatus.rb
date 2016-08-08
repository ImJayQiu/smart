class ImportUstatus

	include CSVImporter

	model Ustatus

	column :code, required: true
	column :date, required: true
	column :status, required: true

end
