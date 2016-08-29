class CreateCscores < ActiveRecord::Migration
	def change
		create_table :cscores do |t|

			# score
			t.string :ccode
			t.integer :att 			# 出勤
			t.integer :homework		# 作业
			t.integer :project		# 项目
			t.integer :report 		# 报告
			t.integer :mid			# 半期考试
			t.integer :fin 			# 期末考试
			t.integer :quiz 		# 课堂测验
			t.integer :other 		# 其他测验
			t.text :remark

			t.timestamps null: false
		end
	end
end
