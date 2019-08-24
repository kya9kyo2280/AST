class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,uniqueness: true ,length: { minimum: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :studies, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :purposes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_studies, through: :likes, source: :study
  has_many :contacts, dependent: :destroy
  has_many :post_times, dependent: :destroy
  attachment :profile_image
  has_many :study_comments, dependent: :destroy

  accepts_nested_attributes_for :scores, :purposes

  def already_liked?(study)
    self.likes.exists?(study_id: study.id)
  end

end
