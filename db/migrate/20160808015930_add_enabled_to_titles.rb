class AddEnabledToTitles < ActiveRecord::Migration[5.0]
  def change
    add_column :titles, :enabled, :boolean
  end
end
