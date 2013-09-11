class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.text :description
      t.string :initiator
      t.string :note
      t.string :number
      t.integer :mark

      t.timestamps
    end
  end
end
