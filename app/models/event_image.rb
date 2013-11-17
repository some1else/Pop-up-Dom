class EventImage < ActiveRecord::Base
  belongs_to :event

  mount_uploader :file, ImageUploader
end