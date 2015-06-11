class RenameColumnGendertInTableUsersToGender < ActiveRecord::Migration
  def change
    rename_column :users, :gendert, :gender
  end
end
