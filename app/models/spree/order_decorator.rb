Spree::Order.class_eval do

  has_many :line_item_addresses, through: :line_items

  def delivery_addresses
    self.line_items.map(&:line_item_addresses).flatten.map(&:address).uniq
  end


  # def check_line_items_quantities?
  #   self.line_items.each do |line_item|
  #     unless line_item.quantity == line_item.line_item_addresses.pluck(:quantity).sum
  #       return false
  #     end
  #   end
  #   return true
  # end

  # To possibilities to reject the order's delivery addresses :
  # 1- The sum of quantities of line_item_addresses does not equals the quantity specified in line_item
  # 2- A line_item_address creating a new unknown address has an invalid quantity
  def check_line_items_quantities?
    self.line_items.each do |line_item|
      line_item_addresses_quantity = line_item.line_item_addresses.pluck(:quantity).sum
      if line_item.quantity == line_item_addresses_quantity
        line_item.line_item_addresses.each do |line_item_address|
          if line_item_address.quantity < 1
            unless self.user.quadvision_user.quadvision_delivery_addresses.pluck(:id).include?(line_item_address.address.id)
              return false
            end
          end
        end
      else
        return false
      end
    end
    return true
  end

end
