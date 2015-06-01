class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.datetime :publication_date
      t.string :author
      t.integer :number_of_pages
      t.float :rating
      t.string :ISBN
      t.string :description
      t.string :picture

      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
