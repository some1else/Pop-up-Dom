ActiveAdmin.register Event do
  config.filters = false
  config.paginate = false

  # CONTROLLER

  controller do
    before_filter :proxy_begins_at_attribute, :only => [:create, :update]

    def new
      @event = Event.new
      # @new_image = @event.event_images.build
      @event.event_occurances.build :begins_at => 1.day.from_now 
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
      params.permit(:name, :description, :begins_at, :price, :tickets, :event_occurances_attributes => [:begins_at, :ends_at, :duration_important], :event_images_attributes => [:position, :_destroy, :file])
    end

    def proxy_begins_at_attribute
      unless params[:event][:event_occurances_attributes].blank?
        params[:event]['begins_at(1i)'] = params[:event][:event_occurances_attributes].first[1]['begins_at(1i)']
        params[:event]['begins_at(2i)'] = params[:event][:event_occurances_attributes].first[1]['begins_at(2i)']
        params[:event]['begins_at(3i)'] = params[:event][:event_occurances_attributes].first[1]['begins_at(3i)']
        params[:event]['begins_at(4i)'] = params[:event][:event_occurances_attributes].first[1]['begins_at(4i)']
        params[:event]['begins_at(5i)'] = params[:event][:event_occurances_attributes].first[1]['begins_at(5i)']
      end
    end
  end

  #INDEX

  index do
    column "Name", :sortable => :name do |c|
      link_to c.name, admin_event_path(c)
    end
    column :description do |c|
      c.description.truncate(100)
    end
    column :begins_at
    column :occurances do |c|
      c.event_occurances.size
    end
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
      row :price
      row :tickets
      row :begins_at
      unless event.event_occurances.empty? || event.event_occurances.size == 1
        row "Occurances" do
          o = ''
          event.event_occurances.each do |occurance|
            if occurance.duration_important?
              o += "#{occurance.begins_at} - #{occurance.ends_at} "
            else
              o += "#{occurance.begins_at}"
            end
            o += '<br>'
          end
          raw o
        end
      end

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
    f.inputs "Info" do
      f.input :name
      f.input :description
      # f.input :client
      f.input :event_category_id, :as => :select, :collection => EventCategory.all.map {|c| [c.name, c.id]}, :include_blank => false
      f.input :begins_at, :label => 'First occurance', class: "timepick", :disabled => true
    end
    f.inputs "Occurances" do
      f.has_many :event_occurances do |occurance_form|
        occurance_form.input :_destroy, :as => :boolean, :required => false, :label => 'Delete occurance' if !occurance_form.object.nil? && !occurance_form.object.new_record?
        occurance_form.input :begins_at
        occurance_form.input :duration_important, :label => 'Duration is important'
        occurance_form.input :ends_at
      end
    end
    unless f.object && f.object.new_record?
      f.inputs "Images" do
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
