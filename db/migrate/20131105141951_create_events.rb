class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.references :category, index: true
      t.datetime :begins_at
      t.decimal :price, precision: 5, scale: 2
      t.integer :tickets

      t.timestamps
    end
  end
end
