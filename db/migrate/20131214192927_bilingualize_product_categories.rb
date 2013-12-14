class BilingualizeProductCategories < ActiveRecord::Migration
  def change
    rename_column :product_categories, :name, :name_sl
    add_column :product_categories, :name_en, :string
  end
end
