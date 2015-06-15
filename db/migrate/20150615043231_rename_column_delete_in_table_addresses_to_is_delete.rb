class RenameColumnDeleteInTableAddressesToIsDelete < ActiveRecord::Migration
  def change
    rename_column :addresses, :delete, :is_delete
  end
end
