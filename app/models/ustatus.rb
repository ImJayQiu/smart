class Ustatus < ActiveRecord::Base

	belongs_to :user, primary_key: :code, foreign_key: :code

	strip_attributes

	strip_attributes :only => [:code], :regex => /[" ", ""]/
	strip_attributes :only => [:date], :regex => /[" ", ""]/
	strip_attributes :only => [:status], :regex => /[" ", ""]/

	validates :code, :date, :status, presence: true


end
