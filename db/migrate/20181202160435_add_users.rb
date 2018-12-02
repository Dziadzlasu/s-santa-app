class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :registration_status, default: 'pending'
      t.boolean :is_admin, default: false
      t.timestamps
    end
  end
end
