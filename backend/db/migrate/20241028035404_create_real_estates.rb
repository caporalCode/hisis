class CreateRealEstates < ActiveRecord::Migration[7.1]
  def change
    create_enum :real_estates_status, %w[available rented saled]
    create_enum :real_estates_available_for, %w[rent sale]
    create_enum :real_estates_furnished_level, %w[fully_furnished partially_furnished unfurnished]

    create_table :real_estates do |t|
      t.string :title
      t.text :description
      t.float :price_per_month
      t.float :size
      t.date :build_date
      t.boolean :furnished, default: false, null: false
      t.enum :status, enum_type: 'real_estates_status', default: :available, null: false
      t.enum :available_for, enum_type: 'real_estates_available_for', default: :rent, null: false
      t.enum :furnished_level, enum_type: 'real_estates_furnished_level', default: :unfurnished, null: false
      t.references :owner, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
