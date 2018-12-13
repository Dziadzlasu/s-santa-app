class AddIndexesForeignKeysToPairings < ActiveRecord::Migration[5.2]
  def change
    add_index :pairings, :giver_id
    add_index :pairings, :recipient_id
    add_foreign_key :pairings, :users, column: :giver_id
    add_foreign_key :pairings, :users, column: :recipient_id
  end
end
