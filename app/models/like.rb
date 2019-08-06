class Like < ApplicationRecord
  belongs_to :study
  belongs_to :user
  validates_uniqueness_of :study_id, scope: :user_id
end
