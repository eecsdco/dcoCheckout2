class ChangeTitleOptionsToText < ActiveRecord::Migration[5.0]
  def change
    change_column :titles, :options_str, :text
  end
end
