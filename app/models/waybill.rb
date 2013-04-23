class Waybill < ActiveRecord::Base
  validates :station_id, :supplier_id, :product_id, :waybill_number, :quantity_supplied, :date_supplied, presence: true

  belongs_to :station
  belongs_to :supplier
  belongs_to :product

  has_many :stock_additions

  accepts_nested_attributes_for :stock_additions
  
  attr_accessible :approved, :date_supplied, :quantity_supplied, :waybill_number,  :station_id, :supplier_id, :description, :product_id, :stock_additions_attributes
end
