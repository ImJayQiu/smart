class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :code
      t.string :name
      t.string :ename
      t.text :remark

      t.timestamps null: false
    end
  end
end
