class PagesController < ApplicationController
  caches_page :landing

  def landing
    @event_categories = EventCategory.all
    @events = Event.includes(:event_occurances, :next_occurance).sort! do |a, b|
      a.first_or_next_occurance.begins_at <=> b.first_or_next_occurance.begins_at
    end

    @product_categories = ProductCategory.all
    @products = Product.published.all :include => :product_author, :order => "random()"

    @partners = Partner.all
    @contacts = Contact.all
    @participants = Participant.all

    # @gallery_images = GalleryImage.all
    # @sponsors = Sponsor.all
  end

  def expire_caches
    expire_page root_path(:locale => :sl)
    expire_page root_path(:locale => :en)
    expire_page root_path(:locale => nil)
    # FileUtils.rm_rf "#{page_cache_directory}/projects"
    # FileUtils.rm_rf "#{page_cache_directory}/api"
    
    # projects = Project.all
    # projects.each do |project|
    #   expire_page projects_path(project)
    # end

    render :text => 'ok'
    # redirect_to admin_path
  end
end
