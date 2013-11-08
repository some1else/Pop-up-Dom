ActiveAdmin.register Participant do
  config.filters = false
  config.paginate = false
  
  index do
    column "Name", :sortable => :name do |c|
      link_to c.name, admin_participant_path(c)
    end
    column "Link", :sortable => :link do |c|
      link_to c.link, c.link
    end
    actions defaults: false do |c|
      link_to 'Edit', edit_admin_participant_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_participant_path(c), :method => 'delete'
    end
  end
end
