class AddCodeToAmenities < ActiveRecord::Migration[7.1]
  def change
    add_column :amenities, :code, :string
    add_index :amenities, :code, unique: true
  end
end
