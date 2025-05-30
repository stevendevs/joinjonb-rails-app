class Course < ApplicationRecord
  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude

    belongs_to :user
    has_many :lessons, dependent: :destroy
    
    has_many_attached :images
    has_rich_text :description

    validates :title, presence: true

    validates :description, :short_description, presence: true, length: { minimum: 5 }
    validates :language, :level, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
     def to_s
       title
     end


     def self.ransackable_attributes(auth_object = nil)
      %w[
        id
        title
        short_description
        description
        language
        level
        price
        user_id
        created_at
        updated_at
      ]
    end
   
    def self.ransackable_associations(auth_object = nil)
      %w[user]
    end


    LANGUAGES = [:"English", :"Russian", :"Polish", :"Spanish"]
    def self.languages
      LANGUAGES.map { |language| [language, language] }
    end
  
    LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
    def self.levels
      LEVELS.map { |level| [level, level] }
    end
  

# PublicActivity
include PublicActivity::Model
tracked owner: Proc.new{ |controller, model| controller.current_user }

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



