class Pump < ActiveRecord::Base
  before_save :humanize_attributes

  validates :tank_id, :name, :code, presence: true
	
  belongs_to :tank
  attr_accessible :code, :manufacturer, :model, :name, :serial_no, :tank_id

  private 
  def humanize_attributes
  	write_attribute(:code, read_attribute(:code).upcase!)
  	write_attribute(:name, read_attribute(:name).upcase!)
  	write_attribute(:serial_no, read_attribute(:serial_no).humanize) unless :serial_no.blank?
  	write_attribute(:manufacturer, read_attribute(:manufacturer).humanize) unless :manufacturer.blank?
  	write_attribute(:model, read_attribute(:model).humanize) unless :model.blank?
  end
end
