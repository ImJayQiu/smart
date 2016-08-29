class Visa < ActiveRecord::Base

	belongs_to :user, foreign_key: :passport, primary_key: :passport

	scope :recent, -> { order('due DESC').limit(1) }

	strip_attributes
	strip_attributes :only => [:passport], :regex => /[" ", ""]/
	strip_attributes :only => [:due], :regex => /[" ", ""]/

	validates :passport, :due, presence: true

	validates :passport, uniqueness: {scope: :due, message: "This record already exist! | 该记录已经存在 ！" }

	def self.as_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end


end
