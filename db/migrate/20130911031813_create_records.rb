class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :point_description
      t.string :point_initiator
      t.string :point_note
      t.string :point_number
      t.integer :point_mark
      t.string :hostel
      t.string :room
      t.text :memo
      t.references :roomer

      t.timestamps
    end
    add_index :records, :roomer_id
  end
end
