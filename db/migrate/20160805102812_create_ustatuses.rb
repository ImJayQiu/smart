class CreateUstatuses < ActiveRecord::Migration
  def change
    create_table :ustatuses do |t|
      t.string :code
      t.date :date
      t.string :status
      t.text :remark

      t.timestamps null: false
    end
  end
end
