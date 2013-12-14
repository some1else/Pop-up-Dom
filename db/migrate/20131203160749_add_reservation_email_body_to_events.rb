class AddReservationEmailBodyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :reservation_email_body, :string
  end
end
