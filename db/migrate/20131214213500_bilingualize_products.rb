class BilingualizeProducts < ActiveRecord::Migration
  def up
    rename_column :products, :name, :name_sl
    add_column :products, :name_en, :string
    rename_column :products, :description, :description_sl
    add_column :products, :description_en, :text
  end

  def down
    rename_column :products, :name_sl, :name
    remove_column :products, :name_en
    rename_column :products, :description_sl, :description
    remove_column :products, :description_en
  end
end
