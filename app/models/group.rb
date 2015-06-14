class Group < ActiveRecord::Base
  has_many :contact_joiners
  has_many :contacts, through: :contact_joiners
end
