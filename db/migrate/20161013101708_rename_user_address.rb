class RenameUserAddress < ActiveRecord::Migration
  def change
    rename_column :spree_line_item_addresses, :user_address_id, :address_id
  end
end
