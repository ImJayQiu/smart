class CreateStudentscores < ActiveRecord::Migration
  def change
    create_table :studentscores do |t|
      t.string :student_code
      t.string :course_code
      t.integer :att
      t.integer :homework
      t.integer :project
      t.integer :report
      t.integer :mid
      t.integer :fin
      t.integer :quiz
      t.integer :other
      t.text :remark

      t.timestamps null: false
    end
  end
end
