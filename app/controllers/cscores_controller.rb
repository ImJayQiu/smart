class CscoresController < ApplicationController

	layout "data"

	before_action :set_cscore, only: [:show, :edit, :update, :destroy]

	# GET /cscores
	# GET /cscores.json
	def index
		@cscores = Cscore.all
	end

	# GET /cscores/1
	# GET /cscores/1.json
	def show
		@cschedule = Cschedule.where( code: @cscore.ccode).first
	end

	# GET /cscores/new
	def new
		@cscore = Cscore.new
	end


	def import

	end

	def imported

		csv_file = params[:file]

		@csv_file = File.read(csv_file.tempfile.to_path.to_s, encoding: "UTF-8")

		import = ImportCscore.new(content: @csv_file)

		import.run!

		@valid_header = import.valid_header?  # => false
		@message = import.report.message # => "The following columns are required: email"
		@error = import.report.invalid_rows.map { |row| [row.model, row.errors] }
		@success = import.report.success? # => true

	end




	# GET /cscores/1/edit
	def edit
	end

	# POST /cscores
	# POST /cscores.json
	def create
		@cscore = Cscore.new(cscore_params)

		respond_to do |format|
			if @cscore.save
				format.html { redirect_to @cscore, notice: 'Cscore was successfully created.' }
				format.json { render :show, status: :created, location: @cscore }
			else
				format.html { render :new }
				format.json { render json: @cscore.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /cscores/1
	# PATCH/PUT /cscores/1.json
	def update
		respond_to do |format|
			if @cscore.update(cscore_params)
				format.html { redirect_to @cscore, notice: 'Cscore was successfully updated.' }
				format.json { render :show, status: :ok, location: @cscore }
			else
				format.html { render :edit }
				format.json { render json: @cscore.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /cscores/1
	# DELETE /cscores/1.json
	def destroy
		@cscore.destroy
		respond_to do |format|
			format.html { redirect_to cscores_url, notice: 'Cscore was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_cscore
		@cscore = Cscore.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def cscore_params
		params.require(:cscore).permit(:ccode, :att, :homework, :project, :report, :mid, :fin, :quiz, :other, :remark)
	end
end
