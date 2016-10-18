class AddQuantityToLineItemAddress < ActiveRecord::Migration
  def change
    add_column :spree_line_item_addresses, :quantity, :integer
  end
end
