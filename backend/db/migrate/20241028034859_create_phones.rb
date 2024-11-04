class CreatePhones < ActiveRecord::Migration[7.1]
  def change
    create_enum :phones_gender, %w[home mobile whatsapp work other]
    create_table :phones do |t|
      t.string :country_code
      t.string :phone_number
      t.enum :gender, enum_type: 'phones_gender'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
