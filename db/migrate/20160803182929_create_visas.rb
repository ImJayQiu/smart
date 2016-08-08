class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :passport
      t.date :due
      t.string :remark

      t.timestamps null: false
    end
  end
end
