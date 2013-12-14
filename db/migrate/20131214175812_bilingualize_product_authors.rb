class BilingualizeProductAuthors < ActiveRecord::Migration
  def up
    rename_column :product_authors, :name, :name_sl
    add_column :product_authors, :name_en, :string
    rename_column :product_authors, :description, :description_sl
    add_column :product_authors, :description_en, :text
  end

  def down
    rename_column :product_authors, :name_sl, :name
    remove_column :product_authors, :name_en
    rename_column :product_authors, :description_sl, :description
    remove_column :product_authors, :description_en
  end
end
