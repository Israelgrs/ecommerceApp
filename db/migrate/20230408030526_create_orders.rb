class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :ad, null: false, foreign_key: true
      t.integer :status, default: 0
      t.references :buyer, null: false

      t.timestamps
    end
  end
end
