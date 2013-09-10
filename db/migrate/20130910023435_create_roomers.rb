class CreateRoomers < ActiveRecord::Migration
  def change
    create_table :roomers do |t|
      t.string :surname
      t.string :name
      t.string :patronymic
      t.references :room
      t.datetime :deleted_at, :default => nil

      t.timestamps
    end
    add_index :roomers, :room_id
  end
end
