class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :book_name
      t.string :description
      t.string :author
      t.string :ISBN

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
