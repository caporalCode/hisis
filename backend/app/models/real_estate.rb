class RealEstate < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :real_estates_amenities, dependent: :destroy
  has_many :amenities, through: :real_estates_amenities
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :rentals
  has_many :tenants, class_name: 'User', through: :rentals
  has_one :address, as: :addressable

  accepts_nested_attributes_for :address, :rooms, :real_estates_amenities

  enum status: { available: 'available', rented: 'rented', saled: 'saled' }
  enum available_for: { rent: 'rent', sale: 'sale' }
  enum furnished_level: { fully_furnished: 'fully_furnished', partially_furnished: 'partially_furnished', unfurnished: 'unfurnished' }
end
