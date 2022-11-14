class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :salt
      t.string :address

      t.timestamps
    end
  end
end
