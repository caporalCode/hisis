# frozen_string_literal: true

# This class represents a rental in the application.
class Rental < ApplicationRecord
  belongs_to :real_estate
  belongs_to :tenant, class_name: 'User', foreign_key: :tenant_id

  accepts_nested_attributes_for :real_estate, :tenant

  enum status: { reserve: 'reserve', ongoing: 'ongoing', ended: 'ended' }
end
