class ParticipantNameFormat < ActiveRecord::Migration
  def change
    rename_column :participants, :name, :first_name
    add_column :participants, :last_name, :string
  end
end
