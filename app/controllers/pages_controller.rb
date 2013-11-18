class PagesController < ApplicationController
  def landing_one
    
  end

  def landing_two
    
  end

  def draft
    @event_categories = EventCategory.all
    @events = Event.all
    @product_categories = ProductCategory.all
    @products = Product.all :include => :product_author
    @participants = Participant.all
    @partners = Partner.all
    @sponsors = Sponsor.all
    @contacts = Contact.all
    @gallery_images = GalleryImage.all
  end
end
