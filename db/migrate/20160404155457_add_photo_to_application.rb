class AddPhotoToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :photo, :string
  end
end
