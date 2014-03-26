ActiveAdmin.register ProductCategory do
  config.filters = false
  config.paginate = false
  
  index do
    column "Name", :sortable => :name_sl do |c|
      link_to my_t(c, :name), admin_product_category_path(c)
    end
    actions defaults: false do |c|
      link_to 'Edit', edit_admin_product_category_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_product_category_path(c), :method => 'delete'
    end
  end

  form do |f|
    f.inputs do
      # f.input :name_sl
      f.input :name_en
    end
    f.actions
  end
end
