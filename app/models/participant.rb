class Participant < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  default_scope order('last_name ASC')

  def name
    "#{first_name} #{last_name}".squish
  end
end
