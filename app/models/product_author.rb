class ProductAuthor < ActiveRecord::Base
  has_many :products
end
