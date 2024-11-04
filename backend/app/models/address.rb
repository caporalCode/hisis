class Address < ApplicationRecord
  geocoded_by :full
  after_validation :geocode

  belongs_to :addressable, polymorphic: true
  def full
    [street, state, city, country].compact.join(', ')
  end
end
