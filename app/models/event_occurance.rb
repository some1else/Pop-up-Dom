class EventOccurance < ActiveRecord::Base
  belongs_to :event

  default_scope { order('begins_at ASC') }

  validates_presence_of :begins_at

  validate :duration_importance

  def duration_importance
    if self.duration_important?
      if !self.ends_at
        errors.add(:ends_at, "Cannot be empty if duration is important")
      end
    end
  end

end
