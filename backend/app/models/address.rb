# frozen_string_literal: true

# This class represents an address and provides functionality for geocoding and storing latitude and longitude.
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  geocoded_by :full do |address, results, _exception|
    if results.empty?
      geo = Geocoder.search(address.street).first
      if geo.present?
        address.latitude = geo.latitude
        address.longitude = geo.longitude
      end
    else
      address.latitude = results.first.latitude
      address.longitude = results.first.longitude
    end
  end
  after_validation :geocode
  def full
    [street, city, country].compact.join(', ')
  end

  validates :street, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
