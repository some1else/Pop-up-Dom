class BilingualizeEventCategories < ActiveRecord::Migration
  def change
    rename_column :event_categories, :name, :name_sl
    add_column :event_categories, :name_en, :string
  end
end
