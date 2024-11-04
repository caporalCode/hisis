class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.float :latitude
      t.float :longitude
      t.string :street
      t.string :state
      t.string :city
      t.string :country
      t.string :country_code
      t.string :state_code
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
