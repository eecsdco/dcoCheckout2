class AllowNullOnTitlesOfficeId < ActiveRecord::Migration[5.0]
  def change
    change_column :titles, :office_id, :integer, :null => true
  end
end
