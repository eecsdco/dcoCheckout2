class AddOptionsToTitles < ActiveRecord::Migration[5.0]
  def change
    add_column :titles, :options, :string
    add_column :records, :option, :string
  end
end
