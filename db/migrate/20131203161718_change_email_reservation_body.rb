class ChangeEmailReservationBody < ActiveRecord::Migration
  def up
    change_column :events, :reservation_email_body, :string, :default => ''
  end
  def down
    change_column :events, :reservation_email_body, :string
  end
end
