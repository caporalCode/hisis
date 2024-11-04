# frozen_string_literal: true

# This class represents a room in the application.
class Room < ApplicationRecord
  belongs_to :real_estate
  enum gender: { bedroom: 'bedroom', bathroom: 'bathroom', livingroom: 'livingroom', kitchen: 'kitchen',
                 garden: 'garden', diningroom: 'diningroom' }
end
