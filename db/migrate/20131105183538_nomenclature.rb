class Nomenclature < ActiveRecord::Migration
  def change
    rename_column :products, :category_id, :product_category_id
    rename_column :products, :author_id, :product_author_id
    rename_column :events, :category_id, :event_category_id
    rename_table :authors, :product_authors
  end
end
