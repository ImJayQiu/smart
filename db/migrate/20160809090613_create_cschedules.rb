class CreateCschedules < ActiveRecord::Migration
  def change
    create_table :cschedules do |t|

      t.string :code 			# 开课号码
      t.string :term_code 		# 学期代码
      t.string :c_code 			# 课程代码
      t.string :credit 			# 学分
	  t.integer :weekday		# 周一--周五
      t.time :stime 			# 上课时间
      t.time :etime 			# 下课时间
      t.string :lecturer 		# 讲师
      t.string :room 			# 教室

	  # score
      t.integer :att 			# 出勤
      t.integer :homework		# 作业
      t.integer :project		# 项目
      t.integer :report 		# 报告
      t.integer :mid			# 半期考试
      t.integer :fin 			# 期末考试
      t.integer :quiz 			# 课堂测验
      t.integer :other 			# 其他测验

      t.text :remark 			# 备注

      t.timestamps null: false
    end
  end
end
