class AddDeletedAtToRecord < ActiveRecord::Migration
  def change
    add_column :records, :deleted_at, :datetime
  end
end
