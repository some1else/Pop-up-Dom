class EventImage < ActiveRecord::Base
  belongs_to :event

  acts_as_list scope: :event

  mount_uploader :file, ImageUploader
end