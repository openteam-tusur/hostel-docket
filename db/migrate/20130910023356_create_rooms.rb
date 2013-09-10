class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :number
      t.references :hostel
      t.datetime :deleted_at, :default => nil

      t.timestamps
    end
    add_index :rooms, :hostel_id
  end
end
