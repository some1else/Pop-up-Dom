class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :role
      t.string :address
      t.string :number

      t.timestamps
    end
  end
end
