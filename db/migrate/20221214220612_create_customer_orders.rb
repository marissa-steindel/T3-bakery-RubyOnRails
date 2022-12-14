class CreateCustomerOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.decimal :GST
      t.decimal :PST
      t.decimal :HST

      t.timestamps
    end
  end
end
