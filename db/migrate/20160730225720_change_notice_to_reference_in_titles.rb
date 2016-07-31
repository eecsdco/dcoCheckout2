class ChangeNoticeToReferenceInTitles < ActiveRecord::Migration[5.0]
  def change
    remove_column :titles, :notice
    add_reference :titles, :notice, foreign_key: true
  end
end
