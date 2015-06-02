class CreatePerusals < ActiveRecord::Migration
  def change
    create_table :perusals do |t|
      t.string :status
      t.boolean :favorite
      
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
