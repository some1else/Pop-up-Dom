ActiveAdmin.register ProductAuthor do
  config.filters = false
  config.paginate = false

  index do
    column "Name", :sortable => :name do |c|
      link_to c.name, admin_product_author_path(c)
    end
    column :description do |c|
      para my_t(c, :description).truncate(100)
    end
    column :link
    actions defaults: false do |c|
      link_to 'Edit', edit_admin_product_author_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_product_author_path(c), :method => 'delete'
    end
  end
  
  form do |f|
    f.inputs do
      f.input :name
      # f.input :description_sl
      f.input :description_en
      f.input :link
    end
    f.actions
  end
end
