class ChangeNullnessOnCategories < ActiveRecord::Migration[5.0]
  def change
    def disallow_null(column, type)
      change_column :categories, column, type, :null => false
    end
    disallow_null :name, :string

    change_column :categories, :description, :string, :null => false
    rename_column :categories, :max_loan, :loan_length_seconds
    disallow_null :loan_length_seconds, :integer
    add_column :categories, :enabled, :boolean, :default => true
  end
end
