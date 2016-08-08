class AddEnabledNotNullToTitles < ActiveRecord::Migration[5.0]
  def change
    change_column :titles, :enabled, :boolean, :null => false
  end
end
