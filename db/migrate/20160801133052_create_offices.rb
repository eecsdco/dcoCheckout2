class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.string :name, :null => false
      t.text :address, :null => false
      t.timestamps
    end
  end
end
