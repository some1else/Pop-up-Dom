class RewriteReservationEmailsOnEvents < ActiveRecord::Migration
  def change
    Event.all.each do |event|
      if event.reservation_email.blank?
        event.reservation_email = 'info@popupdom.si'
      end
      if event.reservation_email_subject.blank?
        event.reservation_email_subject = ''
      end
      event.save
    end
  end
end
