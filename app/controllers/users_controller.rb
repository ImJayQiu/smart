class UsersController < ApplicationController

	require "csv"
	layout "data"

	before_action :set_user, only: [:show, :edit, :update, :destroy]


	# GET /users
	# GET /users.json

	def index
		#@users = User.accessible_by(current_ability)
		@users = User.select(:id, :code, :name, :major, :gender, :role, :passport).all

	end

	def deans
		@deans = User.where(role: "dean").select(:id, :code, :name, :major, :gender, :role, :passport).all
	end

	def lecturers
		@lecturers = User.where(role: "lecturer").select(:id, :code, :name, :major, :gender, :role, :passport).all
	end

	def students
		@students = User.where(role: "student").select(:id, :code, :name, :major, :gender, :role, :passport).all
	end

	def admins
		@admins = User.where(role: "admin").select(:id, :code, :name, :major, :gender, :role, :passport).all
	end

	# GET /users/1
	# GET /users/1.json
	def show
	end

	# GET /users/new
	def new
		@user = User.new
	end

	def import

	end

	def imported

		csv_file = params[:file]

		@csv_file = File.read(csv_file.tempfile.to_path.to_s, encoding: "UTF-8")

		import = ImportUser.new(content: @csv_file)

		import.run!

		@valid_header = import.valid_header?  # => false
		@import_status = import.report.status
		@message = import.report.message # => "The following columns are required: email"
		@error = import.report.invalid_rows.map { |row| [row.model, row.errors] }
		@report = import.report.success? # => true

	end

	# GET /users/1/edit
	def edit
	end

	# POST /users
	# POST /users.json


	def create

		##################if create single user ##################

		@user = User.new(user_params)

		respond_to do |format|
			if @user.save
				format.html { redirect_to @user, notice: 'User was successfully created.' }
				format.json { render :show, status: :created, location: @user }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end

	end

	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user, notice: 'User was successfully updated.' }
				format.json { render :show, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to request.referrer, notice: 'User was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:des, :enroll, :password_confirmation, :password, :avatar, :phone, :address, :major, :code, :email, :name, :ename, :gender, :passport, :birthday, :city, :province, :country, :role)
	end
end
