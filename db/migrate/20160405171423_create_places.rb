class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :longitude
      t.string :latitude
      t.string :name
      t.integer :frequency
      t.references :influencer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
