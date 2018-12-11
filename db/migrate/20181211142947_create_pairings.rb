class CreatePairings < ActiveRecord::Migration[5.2]
  def change
    create_table :pairings do |t|
      t.boolean :active, default: true
      t.integer :giver_id
      t.integer :recipient_id
    end
  end
end
