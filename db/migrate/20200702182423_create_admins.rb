class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins, id: false do |t|
      t.string :uniqname, primary_key: true

      t.timestamps
    end
  end
end
