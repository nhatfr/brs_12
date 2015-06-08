class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :status, null: false

      t.references :book, index: true
      t.references :user, index: true

      t.timestamps null: false
    end

    add_foreign_key :readings, :books
    add_foreign_key :readings, :users
  end
end
