ActiveAdmin.register Sponsor do
  config.filters = false
  config.paginate = false
  
  index do
    column "Logo", :sortable => :file do |c|
      link_to image_tag(c.file, :width => '100'), admin_sponsor_path(c)
    end
    column "Name", :sortable => :name do |c|
      link_to c.name, admin_sponsor_path(c)
    end
    column "Link", :sortable => :link do |c|
      link_to c.link, c.link
    end
    actions defaults: false do |c|
      link_to 'Edit', edit_admin_sponsor_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_sponsor_path(c), :method => 'delete'
    end
  end

  show do |event|
    attributes_table do
      row :name
      row :link
      row :logo do
        # event.
        image_tag(event.file.url, :style => 'height: 200px;')
      end
    end
  end
end
