class ReportUser < ActiveRecord::Base
	validates :name, :phone, :email, presence: true
	validates :email, :phone, uniqueness: true
  attr_accessible :email, :name, :phone, :receive_mail, :receive_sms
end
