ActiveAdmin.register EventCategory do
  config.filters = false
  config.paginate = false
  
  index do
    column "Name", :sortable => :name do |c|
      link_to c.name, admin_event_category_path(c)
    end
    actions defaults: false do |c|
      link_to 'Edit', edit_admin_event_category_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_event_category_path(c), :method => 'delete'
    end
  end
end
