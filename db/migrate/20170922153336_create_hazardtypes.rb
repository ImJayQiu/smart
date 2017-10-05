class CreateHazardtypes < ActiveRecord::Migration
  def change
    create_table :hazardtypes do |t|
      t.string :code
      t.string :name
      t.string :des
      t.string :remark

      t.timestamps null: false
    end
  end
end
