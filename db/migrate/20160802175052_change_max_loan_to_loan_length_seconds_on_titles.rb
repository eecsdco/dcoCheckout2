class ChangeMaxLoanToLoanLengthSecondsOnTitles < ActiveRecord::Migration[5.0]
  def change
    rename_column :titles, :max_loan, :loan_length_seconds
  end
end
