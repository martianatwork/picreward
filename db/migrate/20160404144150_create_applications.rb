class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :campaign, index: true, foreign_key: true
      t.references :influencer, index: true, foreign_key: true
      t.text :motivation
      t.string :status
      t.integer :pic_likes
      t.integer :pic_comments

      t.timestamps null: false
    end
  end
end
