module Spree
  class LineItemAddress < ActiveRecord::Base

    belongs_to :address, class_name: SolidusManyDeliveryAddresses.address_class_name
    belongs_to :line_item, class_name: 'Spree::LineItem'

    accepts_nested_attributes_for :address

    validates :address, presence: true

    before_create :ensure_quantity_for_new_address

    def amount
      self.line_item.price * quantity
    end

    extend Spree::DisplayMoney
    money_methods :amount

    private
    def ensure_quantity_for_new_address
      if address.new_record?
        errors.add(:quantity, I18n.t('activerecord.errors.models.spree/line_item.attributes.quantity.blank_for_new_address')) unless quantity && quantity > 0
      end
    end

  end
end
