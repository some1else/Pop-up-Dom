class AdjustEventTimeZone < ActiveRecord::Migration
  def up
    Event.all.each do |e|
      e.event_occurances.each do |o|
        o.begins_at = o.begins_at - 1.hour
        o.save
      end
    end
  end

  def down
    Event.all.each do |e|
      e.event_occurances.each do |o|
        o.begins_at = o.begins_at + 1.hour
        o.save
      end
    end    
  end
end
