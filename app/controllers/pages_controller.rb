class PagesController < ApplicationController
  def landing
    @event_categories = EventCategory.all
    @events = Event.includes(:event_occurances, :next_occurance).sort! do |a, b|
      a.first_or_next_occurance.begins_at <=> b.first_or_next_occurance.begins_at
    end

    @product_categories = ProductCategory.all
    @products = Product.all :include => :product_author

    @partners = Partner.all
    @contacts = Contact.all
    @participants = Participant.all

    # @gallery_images = GalleryImage.all
    # @sponsors = Sponsor.all
  end
end
