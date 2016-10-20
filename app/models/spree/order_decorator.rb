Spree::Order.class_eval do

  has_many :line_item_addresses, through: :line_items

  def delivery_addresses
    self.line_items.map(&:line_item_addresses).flatten.map(&:address).uniq
  end


  def check_line_items_quantities?
    self.line_items.each do |line_item|
      unless line_item.quantity == line_item.line_item_addresses.pluck(:quantity).sum
        return false
      end
    end
    return true
  end

  def check_line_items_quantities
    self.line_items.each do |line_item|
      line_item_addresses_quantity = line_item.line_item_addresses.pluck(:quantity).sum
      unless line_item.quantity == line_item_addresses_quantity
        line_item.errors.add(:quantity, Spree.t('line_items.errors.line_item_quantity_not_equal_to_line_item_addresses_quantities', line_item_quantity: line_item.quantity, line_item_addresses_quantity: line_item_addresses_quantity))
      end
    end
    true
  end

end
