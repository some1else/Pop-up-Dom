class RecreateEventImageVersionsWithQuality < ActiveRecord::Migration
  def up
    images_count = EventImage.all.size
    EventImage.all.each_with_index do |image, idx|
      image.file.recreate_versions!
      puts "#{idx+1}/#{images_count}"
    end
  end
  def down
    # nothing to do here
  end
end
