class AddOfficeToTitleAndRecord < ActiveRecord::Migration[5.0]
  def change
    change_table(:titles) do |t|
      t.belongs_to :office, index: true
    end
  end
end
