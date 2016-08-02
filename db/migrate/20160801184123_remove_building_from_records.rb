class RemoveBuildingFromRecords < ActiveRecord::Migration[5.0]
  def change
    remove_column :records, :building, :string
  end
end
