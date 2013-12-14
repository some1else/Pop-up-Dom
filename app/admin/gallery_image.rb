 ActiveAdmin.register GalleryImage do

    member_action :move_to_top, :method => :put do
      img = GalleryImage.find(params[:id])
      img.move_to_top
      redirect_to admin_gallery_image_path(img)
    end

    member_action :move_higher, :method => :put do
      img = GalleryImage.find(params[:id])
      img.move_higher
      redirect_to admin_gallery_image_path(img)
    end

    member_action :move_lower, :method => :put do
      img = GalleryImage.find(params[:id])
      img.move_lower
      redirect_to admin_gallery_image_path(img)
    end

    member_action :move_to_bottom, :method => :put do
      img = GalleryImage.find(params[:id])
      img.move_to_bottom
      redirect_to admin_gallery_image_path(img)
    end

  index :as => :grid do |product|
    link_to(image_tag(product.file.url, :width => 200), admin_gallery_image_path(product))
  end

  show do |item|
    attributes_table do
      row :file do
        image_tag item.file.url
      end
    end
  end

    # action_item :only => :show do
    # action_item do |slideshow_image|
    #   link_to('Move higher', move_higher_admin_slideshow_image_path(slideshow_image))
    # end

    # action_item do |slideshow_image|
    #   link_to('Move lower', move_lower_admin_slideshow_image_path(slideshow_image))
    # end

  end