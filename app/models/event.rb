class Event < ActiveRecord::Base
  belongs_to :event_category

  default_scope { order('begins_at ASC') }

  has_many :event_occurances
  accepts_nested_attributes_for :event_occurances, reject_if: lambda {|attributes| attributes['begins_at(1i)'].blank?}, allow_destroy: true

  has_many :event_images
  accepts_nested_attributes_for :event_images, reject_if: lambda {|attributes| attributes['file'].blank?}, allow_destroy: true

  validates_presence_of :name, :description, :begins_at

  validates_associated :event_occurances

  has_one :next_occurance, lambda { where("event_occurances.begins_at > ?", Time.now) }, class_name: "EventOccurance"


  attr_accessor :first_or_next_occurance

  def first_or_next_occurance
    unless @first_or_next_occurance.blank?
      @first_or_next_occurance
    else
      if self.event_occurances.blank?
        @first_or_next_occurance ||= self.event_occurances.build begins_at: self.begins_at
      else
        unless self.next_occurance.blank?
          @first_or_next_occurance ||= self.next_occurance
        else
          @first_or_next_occurance ||= self.event_occurances.first
        end
      end
      @first_or_next_occurance
    end
  end

  def first_or_next_occurance=(occurance)
    @first_or_next_occurance = occurance
  end

  # has_many :future_occurances, conditions: where("event_occurances.begins_at > #{Time.now}"), class_name: "EventOccurance"

  # validate :occurance_count

  # def occurance_count
  #   if self.event_occurances.size < 1
  #     errors.add(:items, "Need 1 or more Event Occurances")
  #   end
  # end

  # before_create :cache_occurance_data

  # def cache_occurance_data
  #   raise self.inspect
  #   if self.event_occurances.size > 0
  #     self.begins_at = self.event_occurances.first.begins_at
  #   else
  #     self.begins_at = nil
  #   end
  # end
end
