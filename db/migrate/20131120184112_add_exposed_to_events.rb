class AddExposedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :exposed, :boolean, :default => false
  end
end
