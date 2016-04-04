class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :address
      t.string :category
      t.string :tva
      t.string :contact_name
      t.string :logo

      t.timestamps null: false
    end
  end
end
