class Study < ApplicationRecord

belongs_to :user
belongs_to :genre
belongs_to :medium
attachment :image

end
