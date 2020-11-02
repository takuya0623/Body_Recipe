class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments,dependent: :destroy
  attachment :image

  with_options presence: true do
    validates :title
    validates :body
    validates :procedure
    validates :material
    validates :image
  end
  validates :calorie, numericality: {only_integer: true}
  validates :is_light, inclusion: {in: [true, false]}
end
