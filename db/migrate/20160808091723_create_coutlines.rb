class CreateCoutlines < ActiveRecord::Migration
  def change
    create_table :coutlines do |t|
      t.string :code
      t.string :ename
      t.string :name
      t.text :des
      t.string :major
      t.string :ctype

      t.timestamps null: false
    end
  end
end
