class EventImage < ActiveRecord::Base
  belongs_to :event

  mount_uploader ImageUploader
end