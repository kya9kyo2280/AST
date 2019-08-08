class Contact < ApplicationRecord
    belongs_to :user
    has_many :contact_comments , dependent: :destroy
end
