class StudentscoresController < ApplicationController

	layout "data"

	before_action :set_studentscore, only: [:show, :edit, :update, :destroy]

	# GET /studentscores
	# GET /studentscores.json
	def index
		@studentscores = Studentscore.all
	end

	# GET /studentscores/1
	# GET /studentscores/1.json
	def show
	end



	def import

	end

	def imported

		csv_file = params[:file]

		@csv_file = File.read(csv_file.tempfile.to_path.to_s, encoding: "UTF-8")

		import = ImportStudentscore.new(content: @csv_file)

		import.run!

		@valid_header = import.valid_header?  # => false
		@message = import.report.message # => "The following columns are required: email"
		@error = import.report.invalid_rows.map { |row| [row.model, row.errors] }
		@success = import.report.success? # => true

	end





	# GET /studentscores/new
	def new
		@studentscore = Studentscore.new
	end

	# GET /studentscores/1/edit
	def edit
	end

	# POST /studentscores
	# POST /studentscores.json
	def create
		@studentscore = Studentscore.new(studentscore_params)

		respond_to do |format|
			if @studentscore.save
				format.html { redirect_to @studentscore, notice: 'Studentscore was successfully created.' }
				format.json { render :show, status: :created, location: @studentscore }
			else
				format.html { render :new }
				format.json { render json: @studentscore.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /studentscores/1
	# PATCH/PUT /studentscores/1.json
	def update
		respond_to do |format|
			if @studentscore.update(studentscore_params)
				format.html { redirect_to @studentscore, notice: 'Studentscore was successfully updated.' }
				format.json { render :show, status: :ok, location: @studentscore }
			else
				format.html { render :edit }
				format.json { render json: @studentscore.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /studentscores/1
	# DELETE /studentscores/1.json
	def destroy
		@studentscore.destroy
		respond_to do |format|
			format.html { redirect_to studentscores_url, notice: 'Studentscore was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_studentscore
		@studentscore = Studentscore.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def studentscore_params
		params.require(:studentscore).permit(:student_code, :course_code, :att, :homework, :project, :report, :mid, :fin, :quiz, :other, :remark)
	end
end
