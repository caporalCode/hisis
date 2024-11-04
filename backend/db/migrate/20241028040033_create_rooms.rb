class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_enum :rooms_gender, %w[bedroom bathroom livingroom kitchen garden diningroom]
    create_table :rooms do |t|
      t.float :size
      t.enum :gender, enum_type: 'rooms_gender', default: :bedroom, null: false
      t.string :description, null: true
      t.references :real_estate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
