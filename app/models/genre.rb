class Genre < ApplicationRecord
	has_many :studies, dependent: :destroy
end
