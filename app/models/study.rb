class Study < ApplicationRecord
 validates :study_title,uniqueness: true ,length: { minimum: 2 }

belongs_to :user
belongs_to :genre
belongs_to :medium
attachment :image
has_many :likes
has_many :liked_users, through: :likes, source: :user
has_many :study_comments, dependent: :destroy

end
