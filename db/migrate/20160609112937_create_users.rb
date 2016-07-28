class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :code
      t.string :name
      t.string :surname
      t.string :sex
      t.string :passport
      t.date :birthday
      t.string :city
      t.string :province
      t.string :country
      t.string :role

      t.timestamps null: false
    end
  end
end
