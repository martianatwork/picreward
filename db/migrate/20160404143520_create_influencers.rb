class CreateInfluencers < ActiveRecord::Migration
  def change
    create_table :influencers do |t|
      t.string :username
      t.integer :followers
      t.integer :avg_photo_comments
      t.integer :avg_photo_likes
      t.string :address
      t.string :number
      t.string :first_name
      t.string :last_name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
