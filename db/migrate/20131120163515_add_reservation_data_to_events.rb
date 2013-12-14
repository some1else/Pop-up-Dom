class AddReservationDataToEvents < ActiveRecord::Migration
  def change
    add_column :events, :open_for_reservation, :boolean, :default => false
    add_column :events, :reservation_email, :string, :default => 'info@popupdom.si'
    add_column :events, :reservation_email_subject, :string
  end
end
