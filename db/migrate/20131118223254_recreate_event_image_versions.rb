class RecreateEventImageVersions < ActiveRecord::Migration
  def change
    images_count = EventImage.all.size
    EventImage.all.each_with_index do |image, idx|
      image.file.recreate_versions!
      puts "#{idx+1}/#{images_count}"
    end
  end
end
