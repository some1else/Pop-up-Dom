class Event < ActiveRecord::Base
  belongs_to :event_category
  has_many :event_images
end
