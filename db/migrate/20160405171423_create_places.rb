class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.references :influencer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
