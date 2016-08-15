class HomeController < ApplicationController

	layout "main"

	def index 

		@lecturer_qty = User.where(role: 'Lecturer').count	# total quantity of lecturers 

		@students = User.where(role: 'Student')		# select students

		@student_qty = @students.count		# total quantity of students


		@students_major = @students.group(:major).count.to_a # group students by major
		@students_gender = @students.group(:gender).count.to_a # group students by major
		@students_country = @students.group(:country).count.to_a # group students by country 
		@students_province = @students.group(:province).count.to_a # group students by province 
		@students_city = @students.group(:city).count.to_a # group students by cities 




		visa_passport = Visa.group(:passport) # group passport  

		visa_max_due = visa_passport.select('id, max(due) as due, passport') 	#find last record of each passport

		@my_visas = visa_passport.where(passport: current_user.passport) # find all visa records of current user




		################### find visas which will be expired with in 14 days. ####################
		#
		$renews = visa_max_due.where("? < due && due < ?", DateTime.now-1.days, DateTime.now + 15.days).order(:due)
		$renews_count = $renews.to_a.count

		###################################################################################################

		################ pie chart of major ##################################
		@major_analysis = LazyHighCharts::HighChart.new('major') do |f|
			f.title(text: I18n.t("major_analysis") )
			f.series({
				name: "数量|Qty.",
				data: @students_major
			})
			f.chart({defaultSeriesType: "pie"})
		end

		################ pie chart of gender ##################################
		@gender_analysis = LazyHighCharts::HighChart.new('gender') do |f|
			f.title(text: I18n.t("Gender") )
			f.xAxis(categories: @students_gender.to_a)
			f.series({
				name: "数量|Qty.",
				data: @students_gender
			})
			f.chart({defaultSeriesType: "column"})
		end



		################ pie chart of country province cities ##################################


		@country_analysis = LazyHighCharts::HighChart.new('country') do |f|
			f.title(text: I18n.t("country_analysis") )
			f.series({
				name: "数量|Qty.",
				data: @students_country     
			})

			f.chart({defaultSeriesType: "pie"})
		end


		@province_analysis = LazyHighCharts::HighChart.new('province') do |f|
			f.title(text: I18n.t("province_analysis") )
			f.series({
				name: "数量|Qty.",
				data: @students_province     
			})

			f.chart({defaultSeriesType: "pie"})
		end

		@city_analysis = LazyHighCharts::HighChart.new('city') do |f|
			f.title(text: I18n.t("city_analysis") )
			f.series({
				name: "数量|Qty.",
				data: @students_city     
			})

			f.chart({defaultSeriesType: "pie"})
		end



		################ end pie chart of country province cities ##################################

	end # end of index action

end  # end of class
