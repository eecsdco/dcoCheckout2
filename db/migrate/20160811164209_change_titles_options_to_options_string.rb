class ChangeTitlesOptionsToOptionsString < ActiveRecord::Migration[5.0]
  def change
    rename_column :titles, :options, :options_str
  end
end
