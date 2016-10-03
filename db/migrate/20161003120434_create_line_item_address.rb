class CreateLineItemAddress < ActiveRecord::Migration
  def change
    create_table :spree_line_item_addresses do |t|
      t.integer :user_address_id
      t.integer :line_item_id

      t.timestamps
    end
  end
end
