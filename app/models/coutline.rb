class Coutline < ActiveRecord::Base

	has_many :cschedules, foreign_key: :c_code, primary_key: :code

	strip_attributes
	strip_attributes :only => [:code], :regex => /[" ", ""]/
	strip_attributes :only => [:name], :regex => /[" ", ""]/
	strip_attributes :only => [:ename], :regex => /[" ", ""]/
	strip_attributes :only => [:major], :regex => /[" ", ""]/
	strip_attributes :only => [:ctype], :regex => /[" ", ""]/

	validates :code, :major, :name, :ctype, presence: true
	validates :code, uniqueness: { message: I18n.t(:unique, :var => I18n.t('Code')) }
	validates :name, uniqueness: { message: I18n.t(:unique, :var => I18n.t('Cname')) }
	
end
