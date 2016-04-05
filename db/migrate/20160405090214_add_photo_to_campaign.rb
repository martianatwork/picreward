class AddPhotoToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :photo, :string
  end
end
