class AddAdditionalContent < ActiveRecord::Migration
  def change
    add_column :events, :additional_description, :text, :default => ''
  end
end
