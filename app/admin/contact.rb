ActiveAdmin.register Contact do
  config.filters = false
  config.paginate = false

  index do
    column "Name", :sortable => :name do |c|
      link_to c.name, admin_contact_path(c)
    end
    column :role do |c|
      my_t c, :role
    end
    column :address
    column :number
    actions defaults: false do |c|
      link_to 'Edit', edit_admin_contact_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_contact_path(c), :method => 'delete'
    end
  end
end
