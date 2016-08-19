class AddOfficeIdToRecords < ActiveRecord::Migration[5.0]
  def change
    add_reference :records, :office, foreign_key: true
  end
end
