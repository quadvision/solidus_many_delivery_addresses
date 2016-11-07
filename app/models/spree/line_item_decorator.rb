Spree::LineItem.class_eval do
  has_many :line_item_addresses, :class_name => 'Spree::LineItemAddress', dependent: :destroy
  accepts_nested_attributes_for :line_item_addresses, allow_destroy: true
end
