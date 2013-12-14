class CreateEventOccurances < ActiveRecord::Migration
  def change
    create_table :event_occurances do |t|
      t.datetime :begins_at
      t.datetime :ends_at
      t.boolean :duration_important, :default => false
      t.references :event, index: true

      t.timestamps
    end
  end
end
