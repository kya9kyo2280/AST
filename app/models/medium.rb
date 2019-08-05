class Medium < ApplicationRecord
	has_many :studies, dependent: :destroy
end
