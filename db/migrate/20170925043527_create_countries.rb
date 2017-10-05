class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :code
      t.string :name
      t.string :slon
      t.string :elon
      t.string :slat
      t.string :elat
      t.string :remark

      t.timestamps null: false
    end
  end
end
