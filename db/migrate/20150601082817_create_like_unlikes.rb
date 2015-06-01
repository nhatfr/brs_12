class CreateLikeUnlikes < ActiveRecord::Migration
  def change
    create_table :like_unlikes do |t|
      t.integer :status
      
      t.references :user, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
