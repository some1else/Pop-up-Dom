class UnexposeAllEvents < ActiveRecord::Migration
  def change
    Event.published.each do |e|
      e.exposed = false
      e.save
    end
  end
end
