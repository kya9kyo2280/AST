class Study < ApplicationRecord

belongs_to :user
belongs_to :genre
belongs_to :medium
attachment :image
has_many :likes
has_many :liked_users, through: :likes, source: :user

end
