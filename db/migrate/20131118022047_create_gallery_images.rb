class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :file
      t.integer :position

      t.timestamps
    end
  end
end
