class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.string :country
      t.string :locality
      t.string :index
      t.text :addres_line
      t.boolean :delete
      t.boolean :main

      t.timestamps null: false
    end
    add_foreign_key :addresses, :users
  end
end
