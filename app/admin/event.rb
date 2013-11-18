ActiveAdmin.register Event do
  config.filters = false
  config.paginate = false

  # CONTROLLER

  controller do
    def new
      @event = Event.new
      # @new_image = @event.event_images.build
      new!
    end

    def edit
      # within @head do
      #   script :src => javascript_path('test.js'), :type => "text/javascript"
      # end
      @event = Event.find(params[:id])
      # @new_image = @event.event_images.build
      edit!
    end

    def update
      @event = Event.find(params[:id])
      # @new_image = @event.event_images.build
      update!
    end

    def permitted_params
      params.permit(:name, :description, :begins_at, :price, :tickets, :event_images_attributes, :position => [:_destroy, :file])
    end
  end

  #INDEX

  index do
    column "Name", :sortable => :name do |c|
      link_to c.name, admin_event_path(c)
    end
    column :description do |c|
      para c.description.truncate(100)
    end
    column :begins_at
    column :price
    column :tickets
    column :pictures do |c|
      c.event_images.size
    end

    actions defaults: false do |c|
      link_to 'Edit', edit_admin_event_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_event_path(c), :method => 'delete'
    end
  end

  # SHOW

  show do |event|
    attributes_table do
      row :name
      row :description
      row :event_category do
        event.event_category.name
      end
      row :begins_at
      row :price
      row :tickets

      # row :results
      # row "Cover Image" do
      #   image_tag(kase.image, :style => 'height: 200px;')
      # end
      unless event.event_images.empty?
        row "Event Images" do
          o = ''
          event.event_images.each do |image|
            o += image_tag(image.file.url, :style => 'height: 200px;')
            o += '<br>'
            
            unless image.first?
              o += link_to('To top', move_to_top_admin_event_image_path(image), :method => 'put', :class => 'button')
            end
            if image.higher_item
              o += link_to('Higher', move_higher_admin_event_image_path(image), :method => 'put', :class => 'button')
            end
            if image.lower_item
              o += link_to('Lower', move_lower_admin_event_image_path(image), :method => 'put', :class => 'button')
            end
            unless image.last?
              o += link_to('To bottom', move_to_bottom_admin_event_image_path(image), :method => 'put', :class => 'button')
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
    f.inputs "Event Info" do
      f.input :name
      f.input :description
      # f.input :client
      f.input :event_category_id, :as => :select, :collection => EventCategory.all.map {|c| [c.name, c.id]}, :include_blank => false
      f.input :begins_at, class: "timepick"
    end      
    unless f.object && f.object.new_record?
      f.inputs "Event images" do
        f.has_many :event_images do |img_form|
          # img_form.link_to 'Help', 'about:blank'
          
            img_form.input :_destroy, :as => :boolean, :required => false, :label => 'Delete image' if !img_form.object.nil? && !img_form.object.new_record? 
            
            if !img_form.object.nil? and !img_form.object.file.nil?
              img_form.input :file, :as => :file, :hint => img_form.template.image_tag(img_form.object.file, :style => 'height: 100px;')
            else
              img_form.input :file, :as => :file
          end
        end
      end

    else
      f.inputs 'Finish Creating the Event to add Images' do
      end
    end
    
    f.actions
  end
end
