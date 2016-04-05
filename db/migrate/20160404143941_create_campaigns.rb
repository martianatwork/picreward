class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :reward_type
      t.string :target_location
      t.string :title
      t.string :product
      t.string :goal
      t.string :start_time
      t.string :end_time
      t.text :description
      t.text :instructions
      t.integer :pics_to_upload
      t.integer :pics_to_post
      t.integer :budget
      t.references :business, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
