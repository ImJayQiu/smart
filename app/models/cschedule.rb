class Cschedule < ActiveRecord::Base


	belongs_to :user, foreign_key: :lecturer, primary_key: :code

	belongs_to :coutline, foreign_key: :c_code, primary_key: :code

	strip_attributes

	strip_attributes :only => [:code, :term_code, :c_code, :credit, :weekday, :stime, :etime, :lecturer, :room, :att, :home, :project, :report, :mid, :final, :quiz, :other], :regex => /[" ", ""]/

	validates :code, :weekday, :term_code, :c_code, :credit, :stime, :etime, :lecturer, :room, presence: true

	validates :code, uniqueness: { message: I18n.t(:unique, :var => I18n.t('class_code')) }

	validates :room, uniqueness: {scope: [:term_code, :weekday, :stime, :etime], message: "您选择的时间段内该教室已被另一门课程使用，请选择其他教室，或选择其他时间段使用该教室!" }

	validates :lecturer, uniqueness: {scope: [:term_code, :weekday, :stime, :etime], message: "您选择的时间段内该名讲师已有其他课程安排，请选择其他时间段, 或者安排另一名讲师!" }

	validates :stime, :etime, :overlap => {:scope => ["room", "term_code", "weekday"], message_title: "时间冲突: ", message_content: "该教室在所选择的时间内正在进行其他的课程，请选择其他时间段, 或者安排另一间教室！" }

	validates :stime, :etime, :overlap => {:scope => ["lecturer", "term_code", "weekday"], message_title: "时间冲突: ", message_content: "该讲师在所选择的时间内正在进行其他的课程，请选择其他时间段, 或者安排另一名讲师！" }
end
