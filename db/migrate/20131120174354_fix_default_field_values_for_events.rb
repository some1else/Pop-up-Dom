class FixDefaultFieldValuesForEvents < ActiveRecord::Migration
  def change
    change_column :events, :reservation_email_subject, :string, :default => ''
  end
end
