class Semester < ActiveRecord::Base

	strip_attributes
	strip_attributes :only => [:code, :ayear, :term, :s_date, :e_date], :regex => /[" ", ""]/

	validates :code, :ayear, :term, :s_date, :e_date, presence: true
	validates :code, uniqueness: {message: I18n.t(:unique, :var => I18n.t('semester_code')) }

end
