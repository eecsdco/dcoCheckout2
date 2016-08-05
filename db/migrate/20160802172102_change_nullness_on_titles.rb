class ChangeNullnessOnTitles < ActiveRecord::Migration[5.0]
  def change
    def disallow_null(column, type)
      change_column :titles, column, type, :null => false
    end
    disallow_null :category_id, :integer
    disallow_null :name, :string
    disallow_null :description, :text
    disallow_null :office_id, :integer

    remove_column :titles, :form_required
  end
end
