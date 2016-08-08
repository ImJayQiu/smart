class Visa < ActiveRecord::Base

	strip_attributes
	strip_attributes :only => [:passport], :regex => /[" ", ""]/
	strip_attributes :only => [:due], :regex => /[" ", ""]/

	validates :passport, :due, presence: true

end
