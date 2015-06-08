class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :cart, index: true
      t.references :user, index: true
      t.references :address, index: true
      t.integer :status
      t.integer :delivery_type
      t.date :dalivery_date
      t.integer :pay_type
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :carts
    add_foreign_key :orders, :users
    add_foreign_key :orders, :addresses
  end
end
