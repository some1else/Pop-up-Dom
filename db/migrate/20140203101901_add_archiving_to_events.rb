class AddArchivingToEvents < ActiveRecord::Migration
  def change
    add_column :events, :archived, :boolean, default: false
    Event.all.each do |event|
      event.archived = true
      event.save
    end
  end
end
