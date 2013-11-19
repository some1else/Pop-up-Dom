class PagesController < ApplicationController
  def landing_one
    
  end

  def landing_two
    
  end

  def draft
    @event_categories = EventCategory.all
    @events = Event.includes(:event_occurances, :next_occurance).sort! do |a, b|
      a.first_or_next_occurance.begins_at <=> b.first_or_next_occurance.begins_at
    end

    @product_categories = ProductCategory.all
    @gallery_images = GalleryImage.all
    @partners = Partner.all
    @contacts = Contact.all
    @participants = Participant.all

    # @products = Product.all :include => :product_author
    # @sponsors = Sponsor.all
  end
end
