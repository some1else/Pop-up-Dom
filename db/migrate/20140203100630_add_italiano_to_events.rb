class AddItalianoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :name_it, :string
    add_column :events, :description_it, :text
    add_column :events, :additional_description_it, :text, :default => ""
  end
end
