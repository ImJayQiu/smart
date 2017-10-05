class HazardsController < ApplicationController

	layout "data"
	require "csv"
	
	before_action :set_hazard, only: [:show, :edit, :update, :destroy]

	# GET /hazards
	# GET /hazards.json
	
	def index
		@hazards = Hazard.all
	end

	def import

	end

	def imported

		csv_file = params[:file]
		u_id = params[:u_id]
		u_country = params[:u_country]

		@csv_file = File.read(csv_file.tempfile.to_path.to_s, encoding: "UTF-8")

		import = ImportHazard.new(content: @csv_file) do 
			after_build do |hazard|
				hazard.operator = u_id 
				hazard.country = u_country 
			end 
		end


		import.run!

		@valid_header = import.valid_header?  # => false
		@message = import.report.message # => "The following columns are required: email"
		@error = import.report.invalid_rows.map { |row| [row.model, row.errors] }
		@success = import.report.success? # => true

	end



	# GET /hazards/1
	# GET /hazards/1.json
	def show
	end

	# GET /hazards/new
	def new
		@hazard = Hazard.new
	end

	# GET /hazards/1/edit
	def edit
	end

	# POST /hazards
	# POST /hazards.json
	def create
		@hazard = Hazard.new(hazard_params)

		respond_to do |format|
			if @hazard.save
				format.html { redirect_to @hazard, notice: 'Hazard was successfully created.' }
				format.json { render :show, status: :created, location: @hazard }
			else
				format.html { render :new }
				format.json { render json: @hazard.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /hazards/1
	# PATCH/PUT /hazards/1.json
	def update
		respond_to do |format|
			if @hazard.update(hazard_params)
				format.html { redirect_to @hazard, notice: 'Hazard was successfully updated.' }
				format.json { render :show, status: :ok, location: @hazard }
			else
				format.html { render :edit }
				format.json { render json: @hazard.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /hazards/1
	# DELETE /hazards/1.json
	def destroy
		@hazard.destroy
		respond_to do |format|
			format.html { redirect_to hazards_url, notice: 'Hazard was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_hazard
		@hazard = Hazard.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def hazard_params
		params.require(:hazard).permit(:operator, :country, :htype, :year, :hde, :hda, :cd, :rd, :pd, :pi, :pm, :pa, :prl, :pe, :ha, :eca, :remark)
	end
end
