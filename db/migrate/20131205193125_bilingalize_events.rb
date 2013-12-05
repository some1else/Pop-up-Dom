class BilingalizeEvents < ActiveRecord::Migration
  def change
    rename_column :events, :name, :name_sl
    add_column :events, :name_en, :string
    rename_column :events, :description, :description_sl
    add_column :events, :description_en, :text
    rename_column :events, :additional_description, :additional_description_sl
    add_column :events, :additional_description_en, :text, :default => ''
  end
end
