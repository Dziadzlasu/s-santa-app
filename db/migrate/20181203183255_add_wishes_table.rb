class AddWishesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.text :description
      t.string :status, default: 'pending'
      t.timestamps
    end

    add_reference :wishes, :user, index: true
    add_foreign_key :wishes, :users, column: :user_id
  end
end
