class CreateHazards < ActiveRecord::Migration
  def change
    create_table :hazards do |t|
      t.string :country
      t.string :state
      t.string :district
      t.string :block
      t.string :village

      t.string :htype
      t.string :year

      t.string :hde
      t.string :hda
      t.string :cd
      t.string :rd
      t.string :pd
      t.string :pi
      t.string :pm
      t.string :pa
      t.string :prl
      t.string :pe
      t.string :ha
      t.string :eca
      t.string :remark

      t.string :operator

      t.timestamps null: false
    end
  end
end
