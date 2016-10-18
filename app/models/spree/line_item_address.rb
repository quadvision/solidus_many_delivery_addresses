module Spree
  class LineItemAddress < ActiveRecord::Base

    belongs_to :address, class_name: SolidusManyDeliveryAddresses.address_class_name
    belongs_to :line_item, class_name: 'Spree::LineItem'

    accepts_nested_attributes_for :address

    validates :address, presence: true

    def amount
      self.line_item.price * quantity
    end

    extend Spree::DisplayMoney
    money_methods :amount

  end
end
