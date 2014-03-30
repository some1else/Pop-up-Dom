ActiveAdmin.register Product do
  config.filters = true
  config.paginate = false

  controller do
    def new
      @product = Product.new
      @new_image = @product.product_images.build
      new!
    end
  end

  index do
    column do |c|
      image_tag c.product_images.first.file.big_thumb.url, :width => 100 unless c.product_images.empty?
    end
    column "Author" do |c|
      if c.product_author != nil
        link_to c.product_author.name, admin_product_author_path(c)
      else
        para ""
      end
    end
    column "Name", :sortable => :name do |c|
      link_to my_t(c, :name), admin_product_path(c)
    end
    column :description do |c|
      para my_t(c, :description).truncate(100)
    end
    column :price
    column :images do |c|
      c.product_images.size || ''
    end
    column :published, :sortable => :published do |c|
      c.published? ? 'Yes' : ''
    end
    actions defaults: false do |c|
      link_to 'Edit', edit_admin_product_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_product_path(c), :method => 'delete'
    end
  end

  # SHOW

  show do |product|
    attributes_table do
      row :name do
        my_t(product, :name)
      end
      row "Product Author" do
        product.product_author.name
      end
      row :description do
        my_t(product, :description)
      end
      row :product_category do
        my_t(product.product_category, :name)
      end
      row :price
      row :published

      unless product.product_images.empty?
        row "Product Images" do
          o = ''
          product.product_images.each do |image|
            o += image_tag(image.file.url, :style => 'height: 200px;')
            o += '<br>'
            
            unless image.first?
              o += link_to('To top', move_to_top_admin_product_image_path(image), :method => 'put', :class => 'button')
            end
            if image.higher_item
              o += link_to('Higher', move_higher_admin_product_image_path(image), :method => 'put', :class => 'button')
            end
            if image.lower_item
              o += link_to('Lower', move_lower_admin_product_image_path(image), :method => 'put', :class => 'button')
            end
            unless image.last?
              o += link_to('To bottom', move_to_bottom_admin_product_image_path(image), :method => 'put', :class => 'button')
            end
            o += '<br>'
            o += '<br>'
          end
          raw o
        end
      end
    end
  end

  # FORM

  form do |f|

    f.inputs "Info" do
      f.input :product_author_id, :as => :select, :collection => ProductAuthor.all.map {|c| [c.name, c.id]}, :include_blank => false
      f.input :product_category_id, :as => :select, :collection => ProductCategory.all.map {|c| [my_t(c, :name), c.id]}, :include_blank => false

      # f.input :name_sl
      f.input :name_en
      # f.input :description_sl
      f.input :description_en
      f.input :price
      f.input :published
    end

    f.inputs "Images" do
      f.has_many :product_images do |img_form|
      
          img_form.input :_destroy, :as => :boolean, :required => false, :label => 'Delete image' if !img_form.object.nil? && !img_form.object.new_record? 
          
          if !img_form.object.nil? and !img_form.object.file.nil?
            img_form.input :file, :as => :file, :hint => img_form.template.image_tag(img_form.object.file, :style => 'height: 100px;')
          else
            img_form.input :file, :as => :file
        end
      end
    end

    f.actions

  end
end
