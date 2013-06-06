class Waybill < ActiveRecord::Base
	#before_save :humanize_attributes

  scope :with_station_and_product, includes(:station, :product)

  validates :station_id, :supplier_id, :product_id, :waybill_number, :quantity_supplied, :date_supplied, presence: true

  belongs_to :station
  belongs_to :supplier
  belongs_to :product

  #has_many :stock_additions
  has_one :stock_addition

  #accepts_nested_attributes_for :stock_additions
  accepts_nested_attributes_for :stock_addition
  
  attr_accessible :approved, :date_supplied, :quantity_supplied, :waybill_number,  :station_id, :supplier_id
  attr_accessible :description, :product_id,  :tanker_driver, :tanker_plate_no, :tanker_registration, :stock_addition_attributes

  # def total_cost
  # 	read_attribute(:product).price * read_attribute(:quantity_supplied)
  # end

  private
  def humanize_attributes
  	write_attribute(:waybill_number, read_attribute(:waybill_number).upcase!)
  	write_attribute(:description, read_attribute(:description).humanize) unless :description.blank?
  	write_attribute(:tanker_driver, read_attribute(:tanker_driver).humanize) unless :tanker_driver.blank?
  	write_attribute(:tanker_registration, read_attribute(:tanker_registration).upcase!) unless :tanker_registration.blank?
  	write_attribute(:tanker_plate_no, read_attribute(:tanker_plate_no).upcase!) unless :tanker_plate_no.blank?
  end
end
