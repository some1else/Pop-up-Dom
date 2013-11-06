class Product < ActiveRecord::Base
  belongs_to :product_author
  belongs_to :product_category
end
