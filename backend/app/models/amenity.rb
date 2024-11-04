class Amenity < ApplicationRecord
  has_one_attached :icon
  has_many :real_estates_amenities
  has_many :real_estates, through: :real_estates_amenities

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
end
