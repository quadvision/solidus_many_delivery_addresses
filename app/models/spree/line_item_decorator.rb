Spree::LineItem.class_eval do
  has_many :line_item_addresses, :class_name => 'Spree::LineItemAddress', dependent: :destroy
  accepts_nested_attributes_for :line_item_addresses, allow_destroy: true

  before_validation :mark_line_item_addresses_for_destruction

  after_create :initialize_line_item_addresses

  private
  def initialize_line_item_addresses
    if self.line_item_addresses.empty?
      self.line_item_addresses << Spree::LineItemAddress.new(address: self.order.user.get_primary_address, quantity: self.quantity)
    end
  end

  def mark_line_item_addresses_for_destruction
    line_item_addresses.each do |line_item_address|
      if line_item_address.quantity.blank? or line_item_address.quantity == 0
        line_item_address.mark_for_destruction
      end
    end
  end

end
