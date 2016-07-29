class CreateTitles < ActiveRecord::Migration[5.0]
  def change
    create_table :titles do |t|
      t.belongs_to :category, index: true
      t.string :name
      t.text :description
      t.text :notice
      t.integer :n_available
      t.boolean :form_required

      t.timestamps
    end
  end
end
