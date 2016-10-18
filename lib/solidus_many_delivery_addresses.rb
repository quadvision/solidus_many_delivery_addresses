require 'solidus_core'
require 'solidus_many_delivery_addresses/engine'

module SolidusManyDeliveryAddresses
  class << self
    attr_accessor :address_class_name

    def address_class_name
      @address_class_name || 'Spree::UserAddress'
    end
  end
end
