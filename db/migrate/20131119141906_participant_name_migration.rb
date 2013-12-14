class ParticipantNameMigration < ActiveRecord::Migration
  def up
    Participant.all.each do |p|
      if p.last_name.blank?
        if !p.first_name.blank?
          p.last_name = p.first_name.split.last
          p.first_name = p.first_name.split.first
          p.save
        end
      end
    end
  end

  def down
    Participant.all.each do |p|
      if !p.last_name.blank?
        p.first_name = "#{p.first_name} #{p.last_name}"
        p.save
      end
    end
  end
end
