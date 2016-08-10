class HomeController < ApplicationController

	layout "main"

	def index 
		@student_qty = User.where(role: 'Student').count
		@lecturer_qty = User.where(role: 'Lecturer').count
	end

end
