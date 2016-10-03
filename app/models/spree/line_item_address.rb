module Spree
  class LineItemAddress < ActiveRecord::Base

    belongs_to :user_address, class_name: 'Spree::UserAddress'
    belongs_to :line_item, class_name: 'Spree::LineItem'

    accepts_nested_attributes_for :user_address
  end
end
