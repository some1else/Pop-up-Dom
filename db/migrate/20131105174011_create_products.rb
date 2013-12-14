class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :author, index: true
      t.references :category, index: true
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
