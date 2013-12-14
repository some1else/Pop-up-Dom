class Partner < ActiveRecord::Base
  mount_uploader :file, ImageUploader
end
