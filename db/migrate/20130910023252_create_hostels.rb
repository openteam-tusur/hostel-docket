class CreateHostels < ActiveRecord::Migration
  def change
    create_table :hostels do |t|
      t.string :address
      t.string :title
      t.integer :contingent_id

      t.timestamps
    end
  end
end
