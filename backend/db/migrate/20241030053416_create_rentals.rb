class CreateRentals < ActiveRecord::Migration[7.1]
  def change
    create_enum :rentals_status, %w[reserve ongoing ended]
    create_table :rentals do |t|
      t.float :total_price
      t.datetime :start_date
      t.integer :months
      t.datetime :end_date
      t.enum :status, enum_type: 'rentals_status', default: :reserve, null: false
      t.references :real_estate, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
