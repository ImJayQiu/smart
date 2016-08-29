module ApplicationHelper

	def time(time)
		if time.nil?
			""
		else
			time.strftime("%H:%M")
		end #if time.nil?
	end #def time(time)

end #module ApplicationHelper
