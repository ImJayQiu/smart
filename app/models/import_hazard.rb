class ImportHazard #< ActiveRecord::Base


	include CSVImporter

	model Hazard 

	 
	column :country, required: true, as: ["Country"] 			
	column :state, as: ["State"] 			
	column :district, as: ["District"] 			
	column :block, as: ["Block"] 			
	column :village, as: ["Village"] 			

	column :year, required: true, as: ["Year"] 			
	column :htype, required: true, as: ["HT"] 			
	column :hde, required: true, as: ["HDE"] 			
	column :hda, required: true, as: ["HDA"] 			
	column :cd, required: true, as: ["CD"] 			
	column :rd, required: true, as: ["RD"] 			
	column :pd, required: true, as: ["PD"] 			
	column :pi, required: true, as: ["PI"]			
	column :pm, required: true, as: ["PM"] 			
	column :pa, required: true, as: ["PA"] 			
	column :prl, required: true, as: ["PRL"] 			
	column :pe, required: true, as: ["PE"] 			
	column :ha, required: true, as: ["HA"] 			
	column :eca, required: true, as: ["ECA"] 			

	identifier :country, :year, :htype

	when_invalid :abort

end

