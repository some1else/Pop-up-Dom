class Contact < ActiveRecord::Base
  acts_as_list

  default_scope order('position ASC')
  validates_presence_of :role, :address 
end
