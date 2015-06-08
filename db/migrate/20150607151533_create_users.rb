class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.string :patronymic
      t.date :b_date
      t.string :m_phone
      t.string :email
      t.string :gendert, limit: 1
      t.integer :role
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
