class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.integer :likes
      t.string :pic_url
      t.references :influencer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
