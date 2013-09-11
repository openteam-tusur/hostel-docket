class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :description
      t.string :initiator
      t.string :note
      t.string :number
      t.integer :mark
      t.string :hostel
      t.string :room
      t.text :memo
      t.references :roomer

      t.timestamps
    end
    add_index :records, :roomer_id
  end
end
