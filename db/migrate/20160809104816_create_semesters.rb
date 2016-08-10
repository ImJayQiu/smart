class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :code
      t.string :ayear
      t.string :term
      t.date :s_date
      t.date :e_date
      t.text :remark

      t.timestamps null: false
    end
  end
end
