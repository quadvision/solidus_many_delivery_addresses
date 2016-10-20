Spree::User.class_eval do
  def get_primary_address
    raise "You should override this to get here an address of type #{SolidusManyDeliveryAddresses.address_class_name}"
  end
end
