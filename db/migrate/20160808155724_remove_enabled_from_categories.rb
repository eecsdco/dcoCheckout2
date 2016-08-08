class RemoveEnabledFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :enabled, :boolean
  end
end
