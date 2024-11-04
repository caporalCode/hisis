class CreateRealEstatesAmenities < ActiveRecord::Migration[7.1]
  def change
    create_table :real_estates_amenities do |t|
      t.references :amenity, null: false, foreign_key: true
      t.references :real_estate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
