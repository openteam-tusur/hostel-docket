class AddPointIdToRecord < ActiveRecord::Migration
  def change
    add_column :records, :point_id, :integer
  end
end
