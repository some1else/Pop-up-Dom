class Sponsor < ActiveRecord::Base
  mount_uploader :file, ImageUploader
end
