class RecreateProductImageVersions < ActiveRecord::Migration
  def up
    images_count = ProductImage.all.size
    ProductImage.all.each_with_index do |image, idx|
      image.file.recreate_versions!
      puts "#{idx+1}/#{images_count}"
    end
  end
  def down
    # nothing to do here
  end
end
