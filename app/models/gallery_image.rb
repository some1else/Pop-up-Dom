class GalleryImage < ActiveRecord::Base
  acts_as_list
  default_scope :order => :position
  
  mount_uploader :file, ImageUploader
end
