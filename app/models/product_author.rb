class ProductAuthor < ActiveRecord::Base
  has_many :products

  default_scope order: 'name ASC'

  validates_presence_of :name
end
