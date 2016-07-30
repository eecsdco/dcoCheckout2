class AddMaxCheckoutTimeToTitles < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :max_loan, :integer
    add_column :titles, :max_loan, :integer
  end
end
