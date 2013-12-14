class ExtractOccurancesFromEvents < ActiveRecord::Migration
  def up
    Event.all.each do |event|
      event.event_occurances.create :begins_at => event.begins_at
    end
  end

  def down
    # No way back bitch
  end
end
