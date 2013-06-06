class AccountsUser < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  # attr_accessible :title, :body
end
