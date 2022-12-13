class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.integer :qty
      t.integer :price
      t.references :Order, null: false, foreign_key: true
      t.references :Product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
