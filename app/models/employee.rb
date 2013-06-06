class Employee < ActiveRecord::Base
	before_save :humanize_attributes

  validates :employee_no, :first_name, :last_name, presence: true
  
  attr_accessible :email, :employee_no, :first_name, :last_name, :phone

  def name
  	"#{self.last_name}, #{self.first_name}"
  end

  private
  def humanize_attributes
  	write_attribute(:employee_no, read_attribute(:employee_no).upcase!)
  	write_attribute(:first_name, read_attribute(:first_name).humanize)
  	write_attribute(:last_name, read_attribute(:last_name).humanize)
  end
end
