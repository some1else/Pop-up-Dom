class BilingualizeContacts < ActiveRecord::Migration
  def change
    rename_column :contacts, :role, :role_sl
    add_column :contacts, :role_en, :string
  end
end
