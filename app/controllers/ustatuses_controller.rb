class UstatusesController < ApplicationController

	require "csv"

	layout "data"

	before_action :set_ustatus, only: [:show, :edit, :update, :destroy]

	# GET /ustatuses
	# GET /ustatuses.json
	def index
		@ustatuses = Ustatus.all
	end

	def import

	end

	def imported

		csv_file = params[:file]

		@csv_file = File.read(csv_file.tempfile.to_path.to_s, encoding: "UTF-8")

		import = ImportUstatus.new(content: @csv_file)

		import.run!

		@valid_header = import.valid_header?  # => false
		@message = import.report.message # => "The following columns are required: email"
		@error = import.report.invalid_rows.map { |row| [row.model, row.errors] }
		@success = import.report.success? # => true

	end


	# GET /ustatuses/1
	# GET /ustatuses/1.json
	def show
		@user = User.where(code: @ustatus.code).first
	end

	# GET /ustatuses/new
	def new
		@ustatus = Ustatus.new
	end

	# GET /ustatuses/1/edit
	def edit
	end

	# POST /ustatuses
	# POST /ustatuses.json
	def create
		@ustatus = Ustatus.new(ustatus_params)

		respond_to do |format|
			if @ustatus.save
				format.html { redirect_to @ustatus, notice: 'Ustatus was successfully created.' }
				format.json { render :show, status: :created, location: @ustatus }
			else
				format.html { render :new }
				format.json { render json: @ustatus.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /ustatuses/1
	# PATCH/PUT /ustatuses/1.json
	def update
		respond_to do |format|
			if @ustatus.update(ustatus_params)
				format.html { redirect_to @ustatus, notice: 'Ustatus was successfully updated.' }
				format.json { render :show, status: :ok, location: @ustatus }
			else
				format.html { render :edit }
				format.json { render json: @ustatus.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /ustatuses/1
	# DELETE /ustatuses/1.json
	def destroy
		@ustatus.destroy
		respond_to do |format|
			format.html { redirect_to ustatuses_url, notice: 'Ustatus was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_ustatus
		@ustatus = Ustatus.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def ustatus_params
		params.require(:ustatus).permit(:code, :date, :status, :remark)
	end
end
