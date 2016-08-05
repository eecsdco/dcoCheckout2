class ChangeNullnessOnNotices < ActiveRecord::Migration[5.0]
  def change
    change_column :notices, :name, :string, :null => false
    change_column :notices, :text, :text, :null => false
  end
end
