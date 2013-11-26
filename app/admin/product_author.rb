ActiveAdmin.register ProductAuthor do
  config.filters = false
  config.paginate = false

  index do
    column "Name", :sortable => :name do |c|
      link_to c.name, admin_product_author_path(c)
    end
    column :description do |c|
      para c.description.truncate(100)
    end
    column :link
    actions defaults: false do |c|
      link_to 'Edit', edit_admin_product_author_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_product_author_path(c), :method => 'delete'
    end
  end
end
