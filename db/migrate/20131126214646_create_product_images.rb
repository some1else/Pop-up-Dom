class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :file
      t.references :product, index: true
      t.integer :position

      t.timestamps
    end
  end
end
