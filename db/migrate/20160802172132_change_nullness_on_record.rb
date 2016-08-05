class ChangeNullnessOnRecord < ActiveRecord::Migration[5.0]
  def change
    def disallow_null(column, type)
      change_column :records, column, type, :null => false
    end
    disallow_null :title_id, :integer
    disallow_null :borrower, :string
    disallow_null :agent, :string
    disallow_null :out, :datetime
  end
end
