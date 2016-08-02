class AddReturnApprovedToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :return_approved, :datetime
  end
end
