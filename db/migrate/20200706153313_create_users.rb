class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :uniqname, primary_key: true

      t.timestamps
    end
  end
end
