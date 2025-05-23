class Course < ApplicationRecord
  
    belongs_to :user
    has_many_attached :images
    has_rich_text :description

    validates :title, presence: true
    validates :description, presence: true, length: {:minimum => 5}
   
     def to_s
       title
     end



     extend FriendlyId
     friendly_id :title, use: :slugged

end
    
    