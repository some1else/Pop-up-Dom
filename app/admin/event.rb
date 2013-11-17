ActiveAdmin.register Event do
  config.filters = false
  config.paginate = false
  
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

    actions defaults: false do |c|
      link_to 'Edit', edit_admin_event_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_event_path(c), :method => 'delete'
    end
  end


  form do |f|
    f.inputs "Event Info" do
      f.input :name
      f.input :description
      # f.input :client
      f.input :event_category_id, :as => :select, :collection => EventCategory.all.map {|c| [c.name, c.id]}, :include_blank => false
    end      
    unless f.object && f.object.new_record?
      f.inputs "Event images" do
        f.has_many :event_images do |img_form|
          # img_form.link_to 'Help', 'about:blank'
          img_form.input :_destroy, :as => :boolean, :required => false, :label => 'Delete image' unless img_form.object.new_record? 
          img_form.input :image, :as => :file, :hint => img_form.template.image_tag(img_form.object.image, :style => 'height: 100px;')
        end
      end

    else
      f.inputs 'Finish Creating the Case to add Result Graphs and Slideshow Images' do
      end
    end
    
    f.actions
  end
end
