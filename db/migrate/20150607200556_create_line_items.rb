class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :cart, index: true
      t.references :product, index: true
      t.integer :quantity
      t.decimal :price, precision: 15, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :line_items, :carts
    add_foreign_key :line_items, :products
  end
end
