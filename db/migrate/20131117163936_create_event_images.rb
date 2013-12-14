class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.string :file
      t.references :event, :index => true

      t.timestamps
    end
  end
end
