class RemoveLogoFromBusiness < ActiveRecord::Migration
  def change
    remove_column :businesses, :logo, :string
  end
end
