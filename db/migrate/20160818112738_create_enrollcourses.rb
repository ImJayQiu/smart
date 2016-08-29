class CreateEnrollcourses < ActiveRecord::Migration
  def change
    create_table :enrollcourses do |t|
      t.string :code
      t.string :ccode
      t.string :remark

      t.timestamps null: false
    end
  end
end
