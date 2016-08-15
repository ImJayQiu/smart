class Visa < ActiveRecord::Base

	belongs_to :user, foreign_key: :passport, primary_key: :passport

	scope :recent, -> { order('due DESC').limit(1) }

	strip_attributes
	strip_attributes :only => [:passport], :regex => /[" ", ""]/
	strip_attributes :only => [:due], :regex => /[" ", ""]/

	validates :passport, :due, presence: true

	validates :passport, uniqueness: {scope: :due, message: "This record already exist! | 该记录已经存在 ！" }
end
