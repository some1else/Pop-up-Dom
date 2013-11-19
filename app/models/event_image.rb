class EventImage < ActiveRecord::Base
  belongs_to :event

  acts_as_list scope: :event
  default_scope { order('position ASC') }
  
  mount_uploader :file, EventImageUploader
end