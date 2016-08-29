class EnrollcoursesController < ApplicationController

	require "csv"
	layout "data"

	before_action :set_enrollcourse, only: [:show, :edit, :update, :destroy]

	# GET /enrollcourses
	# GET /enrollcourses.json
	
	def index
		@enrollcourses = Enrollcourse.all
	end

	def multi 

	end

	def multienroll 

		@students = params[:student_code].each_line.to_a
		@courses = params[:course_code].each_line.to_a
		@cs = @students.product(@courses).insert(0, ["code","ccode"]).to_a 

		csv_file = CSV.generate do |csv| 
			@cs.each do |row| 
				csv << row
			end
		end

		import = ImportEnrollcourse.new(content: csv_file)

		import.run!

		@valid_header = import.valid_header?  # => false
		@message = import.report.message # => "The following columns are required: email"
		@error = import.report.invalid_rows.map { |row| [row.model, row.errors] }
		@success = import.report.success? # => true

	end


	def import

	end

	def imported

		csv_file = params[:file]

		@csv_file = File.read(csv_file.tempfile.to_path.to_s, encoding: "UTF-8")

		import = ImportEnrollcourse.new(content: @csv_file)

		import.run!

		@valid_header = import.valid_header?  # => false
		@message = import.report.message # => "The following columns are required: email"
		@error = import.report.invalid_rows.map { |row| [row.model, row.errors] }
		@success = import.report.success? # => true

	end



	# GET /enrollcourses/1
	# GET /enrollcourses/1.json
	def show
		@user = User.where(code: @enrollcourse.code).first
		@class = Cschedule.where(code: @enrollcourse.ccode).first
	end


	# GET /enrollcourses/new
	def new
		@enrollcourse = Enrollcourse.new
	end


	# GET /enrollcourses/1/edit
	def edit
	end


	# POST /enrollcourses
	# POST /enrollcourses.json
	def create
		@enrollcourse = Enrollcourse.new(enrollcourse_params)

		respond_to do |format|
			if @enrollcourse.save
				format.html { redirect_to @enrollcourse, notice: 'Enrollcourse was successfully created.' }
				format.json { render :show, status: :created, location: @enrollcourse }
			else
				format.html { render :new }
				format.json { render json: @enrollcourse.errors, status: :unprocessable_entity }
			end
		end
	end


	# PATCH/PUT /enrollcourses/1
	# PATCH/PUT /enrollcourses/1.json
	def update
		respond_to do |format|
			if @enrollcourse.update(enrollcourse_params)
				format.html { redirect_to @enrollcourse, notice: 'Enrollcourse was successfully updated.' }
				format.json { render :show, status: :ok, location: @enrollcourse }
			else
				format.html { render :edit }
				format.json { render json: @enrollcourse.errors, status: :unprocessable_entity }
			end
		end
	end


	# DELETE /enrollcourses/1
	# DELETE /enrollcourses/1.json
	def destroy
		@enrollcourse.destroy
		respond_to do |format|
			format.html { redirect_to enrollcourses_url, notice: 'Enrollcourse was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	# Use callbacks to share common setup or constraints between actions.

	def set_enrollcourse
		@enrollcourse = Enrollcourse.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def enrollcourse_params
		params.require(:enrollcourse).permit(:code, :ccode, :remark)
	end

end
