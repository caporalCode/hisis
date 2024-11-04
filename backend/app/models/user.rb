# frozen_string_literal: true

# This class represents a user in the application.
class User < ApplicationRecord
  has_many :notifications
  has_many :searches
  has_many :phones, dependent: :destroy
  has_many :real_estates, foreign_key: :owner_id
  has_many :rentals
  has_many :rented_real_estates, through: :rentals, source: :real_estate
  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :phones, :address

  enum role: { user: 'user', admin: 'admin' }
  enum gender: { male: 'male', female: 'female' }
end
