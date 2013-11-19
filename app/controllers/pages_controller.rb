class PagesController < ApplicationController
  def landing_one
    
  end

  def landing_two
    
  end

  def draft
    @event_categories = EventCategory.all
    @events = Event.all
    @events.sort{ |a, b| a.first_or_next_occurance.begins_at <=> b.first_or_next_occurance.begins_at }

    @product_categories = ProductCategory.all
    @products = Product.all :include => :product_author
    @participants = Participant.all
    @partners = Partner.all
    @sponsors = Sponsor.all
    @contacts = Contact.all
    @gallery_images = GalleryImage.all
  end
end
