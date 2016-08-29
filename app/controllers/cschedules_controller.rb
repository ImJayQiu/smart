class CschedulesController < ApplicationController

	require "csv"
	layout "data"

	before_action :set_cschedule, only: [:show, :edit, :update, :destroy]

	# GET /cschedules
	# GET /cschedules.json
	
	def index
		@cschedules = Cschedule.select(:id, :code, :c_code, :term_code, :room, :weekday, :stime, :etime, :lecturer).order('term_code DESC')
	end

	# GET /cschedules/1
	# GET /cschedules/1.json
	def show
		@lecturer = User.where(code: @cschedule.lecturer)
		@cscore = Cscore.where(ccode: @cschedule.code).first
#		@total_score = @cscore.att + @cscore.homework + @cscore.project + @cscore.report + @cscore.mid + @cscore.fin + @cscore.quiz + @cscore.other rescue nil
	end


	def import

	end

	def imported

		csv_file = params[:file]

		@csv_file = File.read(csv_file.tempfile.to_path.to_s, encoding: "UTF-8")

		import = ImportCschedule.new(content: @csv_file)

		import.run!

		@valid_header = import.valid_header?  # => false
		@message = import.report.message # => "The following columns are required: email"
		@error = import.report.invalid_rows.map { |row| [row.model, row.errors] }
		@success = import.report.success? # => true

	end


	# GET /cschedules/new
	def new
		@cschedule = Cschedule.new
	end

	# GET /cschedules/1/edit
	def edit
	end

	# POST /cschedules
	# POST /cschedules.json
	def create
		@cschedule = Cschedule.new(cschedule_params)

		respond_to do |format|
			if @cschedule.save
				format.html { redirect_to @cschedule, notice: 'Cschedule was successfully created.' }
				format.json { render :show, status: :created, location: @cschedule }
			else
				format.html { render :new }
				format.json { render json: @cschedule.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /cschedules/1
	# PATCH/PUT /cschedules/1.json
	def update
		respond_to do |format|
			if @cschedule.update(cschedule_params)
				format.html { redirect_to @cschedule, notice: 'Cschedule was successfully updated.' }
				format.json { render :show, status: :ok, location: @cschedule }
			else
				format.html { render :edit }
				format.json { render json: @cschedule.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /cschedules/1
	# DELETE /cschedules/1.json
	def destroy
		@cschedule.destroy
		respond_to do |format|
			format.html { redirect_to cschedules_url, notice: 'Cschedule was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_cschedule
		@cschedule = Cschedule.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def cschedule_params
		params.require(:cschedule).permit(:credit, :weekday, :code, :term_code, :c_code, :stime, :etime, :lecturer, :room) #, :att, :homework, :project, :report, :mid, :fin, :quiz, :other, :remark)
	end
end
