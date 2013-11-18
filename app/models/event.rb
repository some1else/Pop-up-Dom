class Event < ActiveRecord::Base
  belongs_to :event_category

  default_scope order('begins_at ASC')

  has_many :event_images
  accepts_nested_attributes_for :event_images, reject_if: lambda {|attributes| attributes['file'].blank?}, allow_destroy: true
end
