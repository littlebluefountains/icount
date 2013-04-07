class ProductPrices < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  attr_accessible :new_price, :old_price, :product_id, :user_id
end
