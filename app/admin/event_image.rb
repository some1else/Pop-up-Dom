 ActiveAdmin.register EventImage do
    menu false

    member_action :move_to_top, :method => :put do
      img = EventImage.find(params[:id])
      img.move_to_top
      redirect_to admin_event_path(img.event_id)
    end
    member_action :move_higher, :method => :put do
      img = EventImage.find(params[:id])
      img.move_higher
      redirect_to admin_event_path(img.event_id)
    end

    member_action :move_lower, :method => :put do
      img = EventImage.find(params[:id])
      img.move_lower
      redirect_to admin_event_path(img.event_id)
    end
    member_action :move_to_bottom, :method => :put do
      img = EventImage.find(params[:id])
      img.move_to_bottom
      redirect_to admin_event_path(img.event_id)
    end


    # action_item :only => :show do
    # action_item do |slideshow_image|
    #   link_to('Move higher', move_higher_admin_slideshow_image_path(slideshow_image))
    # end

    # action_item do |slideshow_image|
    #   link_to('Move lower', move_lower_admin_slideshow_image_path(slideshow_image))
    # end

  end