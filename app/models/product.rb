class Product < ActiveRecord::Base
  belongs_to :product_author
  belongs_to :product_category

  has_many :product_images
  accepts_nested_attributes_for :product_images, reject_if: lambda {|attributes| attributes['file'].blank?}, allow_destroy: true

  validates_presence_of :name #, :description

end
