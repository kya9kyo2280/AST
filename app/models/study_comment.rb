class StudyComment < ApplicationRecord
	  belongs_to :user
      belongs_to :study
end
