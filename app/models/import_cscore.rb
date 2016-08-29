class ImportCscore

	include CSVImporter

	model Cscore 

	# score
	column :ccode, required: true 			
	column :att, required: true 			# 出勤
	column :homework, required: true		# 作业
	column :project, required: true			# 项目
	column :report, required: true 			# 报告
	column :mid, required: true				# 半期考试
	column :fin, required: true 			# 期末考试
	column :quiz, required: true 			# 课堂测验
	column :other, required: true 			# 其他测验



end
