class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :passport
      t.date :due
      t.text :remark

      t.timestamps null: false
    end
  end
end
