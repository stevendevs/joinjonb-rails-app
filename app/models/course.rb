class Course < ApplicationRecord
  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude

    belongs_to :user
    has_many_attached :images
    has_rich_text :description

    validates :title, presence: true

    validates :description, :short_description, presence: true, length: { minimum: 5 }
    validates :language, :level, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
     def to_s
       title
     end



     extend FriendlyId
     friendly_id :title, use: :slugged

validates_presence_of :location
after_validation :geocode_x_and_y


     private  

     def geocode_x_and_y
      return if location.blank?
    
      results = Geocoder.search(location)
      if results.present? && results.first&.coordinates.present?
        coords = results.first.coordinates
        self.latitude = coords[0]
        self.longitude = coords[1]
      end
    end
    

end



