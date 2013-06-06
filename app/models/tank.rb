class Tank < ActiveRecord::Base
  #before_save :humanize_attributes

  validates :product_id, :station_id, :name, :code, :capacity, presence: true

  attr_accessible :capacity, :code, :name, :product_id, :station_id

  belongs_to :product
  belongs_to :station

  has_many :stocks
  has_many :pumps

  has_many :dipping_histories

  #scopes
  #scope for tracking latest value of stock
  scope :get_latest_stock, lambda { |tank_id| :stocks.where(id: tank_id).order("updated_at desc").first } 
  scope :by_station, lambda { |id| where(station_id: id) }
  scope :by_product, lambda { |id| where(product_id: id) }
  
  #class methods
  def pump_count
  	pumps.count
  end

  private
  def humanize_attributes
    write_attribute(:code, read_attribute(:code).upcase!)
    write_attribute(:name, read_attribute(:name).upcase!)
  end
  # def self.by_station(id)
  # 	#where("station_id == ?", id)
  # 	where(station_id: id)
  # end

  # def self.by_station_and_product(station, product)
  # 	where(station_id: station AND product_id: product)
  # end

  # def by_product(id)
  # 	where(product_id: id)
  # end

  # def elf.get_latest_stock(tank_id)
  # 	:stocks.where(id: tank_id).order(:updated_at desc).first
  # end
end
