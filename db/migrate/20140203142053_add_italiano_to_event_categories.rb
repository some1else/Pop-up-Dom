class AddItalianoToEventCategories < ActiveRecord::Migration
  def change
    add_column :event_categories, :name_it, :string
  end
end
