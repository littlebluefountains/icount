class Employee < ActiveRecord::Base
  validates :employee_no, :first_name, presence: true
  
  attr_accessible :email, :employee_no, :first_name, :last_name, :phone

  def name
  	"#{self.last_name}, #{self.first_name}"
  end
end
