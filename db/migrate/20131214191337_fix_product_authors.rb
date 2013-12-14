class FixProductAuthors < ActiveRecord::Migration
  def up
    remove_column :product_authors, :name_en
    rename_column :product_authors, :name_sl, :name
  end

  def down
    rename_column :product_authors, :name, :name_sl
    add_column :product_authors, :name_en, :string
  end
end
