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

  def usertime
                     if scores.last.current_score < 201
                        0
                     elsif scores.last.current_score < 251
                        200
                     elsif scores.last.current_score < 301
                        400
                     elsif scores.last.current_score < 351
                        600
                     elsif scores.last.current_score < 401
                        800
                     elsif scores.last.current_score < 451
                        950
                     elsif scores.last.current_score < 501
                        1100
                     elsif scores.last.current_score < 551
                        1250
                     elsif scores.last.current_score < 601
                        1400
                     elsif scores.last.current_score < 651
                        1550
                     elsif scores.last.current_score < 701
                        1700
                     elsif scores.last.current_score < 751
                        2000
                     elsif scores.last.current_score < 801
                        2300
                     elsif scores.last.current_score < 851
                        2600
                     elsif scores.last.current_score < 901
                        2900
                     elsif scores.last.current_score < 951
                        3400
                     else
                        3900
                     end

  end

  def purposetime
                     if purposes.last.purpose_score < 201
                        0
                     elsif purposes.last.purpose_score < 251
                        200
                     elsif purposes.last.purpose_score < 301
                        400
                     elsif purposes.last.purpose_score < 351
                        600
                     elsif purposes.last.purpose_score < 401
                        800
                     elsif purposes.last.purpose_score < 451
                        950
                     elsif purposes.last.purpose_score < 501
                        1100
                     elsif purposes.last.purpose_score < 551
                        1250
                     elsif purposes.last.purpose_score < 601
                        1400
                     elsif purposes.last.purpose_score < 651
                        1550
                     elsif purposes.last.purpose_score < 701
                        1700
                     elsif purposes.last.purpose_score < 751
                        2000
                     elsif purposes.last.purpose_score < 801
                        2300
                     elsif purposes.last.purpose_score < 851
                        2600
                     elsif purposes.last.purpose_score < 901
                        2900
                     elsif purposes.last.purpose_score < 951
                        3400
                     else
                        3900
                     end
  end

end
