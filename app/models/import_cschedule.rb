class ImportCschedule

	include CSVImporter

	model Cschedule 

	column :code, required: true 			# 开课号码
	column :term_code, required: true 		# 学期代码
	column :c_code, required: true 			# 课程代码
	column :credit, required: true 			# 学分
	column :weekday, required: true		# 周一--周五
	column :stime, required: true 			# 上课时间
	column :etime, required: true 			# 上课时间
	column :lecturer, required: true 		# 讲师
	column :room, required: true		# 教室

	# score
	column :att 			# 出勤
	column :homework		# 作业
	column :project		# 项目
	column :report 		# 报告
	column :mid			# 半期考试
	column :fin 			# 期末考试
	column :quiz 			# 课堂测验
	column :other 			# 其他测验



end
