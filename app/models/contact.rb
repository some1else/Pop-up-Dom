class Contact < ActiveRecord::Base
  acts_as_list

  validates_presence_of :role, :address 
end
