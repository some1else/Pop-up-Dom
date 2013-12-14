class AddPositionToEventImages < ActiveRecord::Migration
  def change
    add_column :event_images, :position, :integer
  end
end
