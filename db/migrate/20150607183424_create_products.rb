class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, index: true
      t.text :description
      t.attachment :image
      t.integer :amount
      t.decimal :price, precision: 15, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :products, :categories
  end
end
