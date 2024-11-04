class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.text :message
      t.integer :priority
      t.text :link
      t.string :type
      t.string :status
      t.datetime :read_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
