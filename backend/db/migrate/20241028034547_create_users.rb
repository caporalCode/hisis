class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_enum :users_role, %w[admin user]
    create_enum :users_gender, %w[male female]

    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.date :birthday
      t.enum :role, enum_type: 'users_role', default: :user, null: false
      t.enum :gender, enum_type: 'users_gender'

      t.timestamps
    end
  end
end
