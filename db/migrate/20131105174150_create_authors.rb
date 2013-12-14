class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :description
      t.string :links

      t.timestamps
    end
  end
end
