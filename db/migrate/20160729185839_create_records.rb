class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.belongs_to :title, index:true
      t.string :borrower
      t.text :note
      t.string :building
      t.string :agent
      t.datetime :out
      t.datetime :in

      t.timestamps
    end
  end
end
