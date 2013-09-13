class AddDocumentNumberToRecord < ActiveRecord::Migration
  def change
    add_column :records, :document_number, :string
  end
end
