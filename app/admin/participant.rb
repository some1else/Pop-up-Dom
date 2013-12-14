ActiveAdmin.register Participant do
  config.filters = false
  config.paginate = false
  
  index do
    column "First name", :sortable => :first_name do |c|
      link_to c.first_name, admin_participant_path(c)
    end
    column "Last name", :sortable => :last_name do |c|
      link_to c.last_name, admin_participant_path(c)
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

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :link
    end
    f.actions
  end

  show do |participant|
    attributes_table do
      row :first_name
      row :last_name
      row :link do |p|
        link_to p.link, p.link
      end
    end
  end

end
