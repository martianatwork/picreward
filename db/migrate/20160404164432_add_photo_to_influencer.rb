class AddPhotoToInfluencer < ActiveRecord::Migration
  def change
    add_column :influencers, :photo, :string
  end
end
