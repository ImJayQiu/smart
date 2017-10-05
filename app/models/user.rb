class User < ActiveRecord::Base


	has_many :cschedules, primary_key: :code , foreign_key: :lecturer
#	has_many :visas, primary_key: :passport , foreign_key: :passport 
	has_many :ustatuses, primary_key: :code , foreign_key: :code 

	devise :database_authenticatable, :trackable, :validatable, :timeoutable, :registerable

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	#

	attr_accessor :login
	attr_accessor :file


	strip_attributes
	strip_attributes :only => [:city], :regex => /["市", ""]/
	strip_attributes :only => [:province], :regex => /["省", ""]/
	strip_attributes :only => [:code], :regex => /[" ", ""]/
#	strip_attributes :only => [:passport], :regex => /[" ", ""]/
	strip_attributes :only => [:phone], :regex => /[" ", ""]/

#	validates :code, :fname, presence: true
#	validates :code, uniqueness: { message: I18n.t(:unique, :var => I18n.t('Code')) }
#	validates :passport, uniqueness: { message: I18n.t(:unique, :var => I18n.t('Passport')) }
	validates :email, uniqueness: { message: I18n.t(:unique, :var => I18n.t('Email')) }
	validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 0.5.megabytes

#	validates_inclusion_of :major, in: Major.select("code").to_a, message: " | error: 所选择的专业不存在,请重新确认专业代码 | The major not exists, please check major code again." 



	has_attached_file :avatar, styles: { medium: "280x280#", thumb: "50x50#" }, default_url: "/system/users/avatars/missing.jpg"

	validates_attachment :avatar,
		content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


	def self.find_for_database_authentication(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions.to_h).where(["lower(code) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		elsif conditions.has_key?(:code) || conditions.has_key?(:email)
			where(conditions.to_h).first
		end
	end



=begin
	def import_save
		if imported_user.map(&:valid?).all?
			imported_user.each(&:save!)
			true
		else
			imported_user.each_with_index do |user, index|
				user.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end


	def imported_user
		@imported_user ||= load_imported_user
	end

	def load_imported_user
		spreadsheet = Roo::Spreadsheet.open(file.path)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			user = User.find_by(code: row["code"]) || User.new
			user.attributes = row.to_hash
			user
		end    
	end
=end

end
