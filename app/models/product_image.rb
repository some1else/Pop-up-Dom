class ProductImage < ActiveRecord::Base
  belongs_to :product

  acts_as_list scope: :product
  default_scope { order('position ASC') }

  mount_uploader :file, ProductImageUploader
end
