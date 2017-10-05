class HazardtypesController < ApplicationController
	layout "data"
	before_action :set_hazardtype, only: [:show, :edit, :update, :destroy]

	# GET /hazardtypes
	# GET /hazardtypes.json
	def index
		@hazardtypes = Hazardtype.all
	end

	# GET /hazardtypes/1
	# GET /hazardtypes/1.json
	def show
	end

	# GET /hazardtypes/new
	def new
		@hazardtype = Hazardtype.new
	end

	# GET /hazardtypes/1/edit
	def edit
	end

	# POST /hazardtypes
	# POST /hazardtypes.json
	def create
		@hazardtype = Hazardtype.new(hazardtype_params)

		respond_to do |format|
			if @hazardtype.save
				format.html { redirect_to @hazardtype, notice: 'Hazardtype was successfully created.' }
				format.json { render :show, status: :created, location: @hazardtype }
			else
				format.html { render :new }
				format.json { render json: @hazardtype.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /hazardtypes/1
	# PATCH/PUT /hazardtypes/1.json
	def update
		respond_to do |format|
			if @hazardtype.update(hazardtype_params)
				format.html { redirect_to @hazardtype, notice: 'Hazardtype was successfully updated.' }
				format.json { render :show, status: :ok, location: @hazardtype }
			else
				format.html { render :edit }
				format.json { render json: @hazardtype.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /hazardtypes/1
	# DELETE /hazardtypes/1.json
	def destroy
		@hazardtype.destroy
		respond_to do |format|
			format.html { redirect_to hazardtypes_url, notice: 'Hazardtype was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_hazardtype
		@hazardtype = Hazardtype.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def hazardtype_params
		params.require(:hazardtype).permit(:code, :name, :des, :remark)
	end
end
