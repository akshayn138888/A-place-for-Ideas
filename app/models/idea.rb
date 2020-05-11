class Idea < ApplicationRecord
    belongs_to :user
    has_many(:reviews,dependent: :destroy)
    validates(:title, presence: true, uniqueness: true)
    
    has_many :likes
    has_many :likers, through: :likes, source: :user
    
    validates(
        :description,
        presence: { message: "must exist" }
    )
end
