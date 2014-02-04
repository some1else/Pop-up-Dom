class Event < ActiveRecord::Base
  belongs_to :event_category

  has_many :event_occurances
  accepts_nested_attributes_for :event_occurances, reject_if: lambda {|attributes| attributes['begins_at(1i)'].blank?}, allow_destroy: true

  has_many :event_images
  accepts_nested_attributes_for :event_images, reject_if: lambda {|attributes| attributes['file'].blank?}, allow_destroy: true

  validates_presence_of :name_sl, :description_sl, :begins_at

  validates_associated :event_occurances

  scope :published, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }

  has_one :next_occurance, lambda { where("event_occurances.begins_at > ?", Time.now) }, class_name: "EventOccurance"

  attr_accessor :first_or_next_occurance

  def has_future_occurances?
    if first_or_next_occurance != nil
      if first_or_next_occurance.begins_at > Time.now
        true
      else
        false
      end
    else
      false
    end
  end

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

end
