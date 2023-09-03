class CreateHostels < ActiveRecord::Migration[7.0]
  def change
    create_table :hostels do |t|
      t.string :room_type
      t.integer :total_occupancy
      t.integer :total_bedrooms
      t.integer :total_bathrooms
      t.integer :total_beds
      t.string :summary
      t.string :address
      t.boolean :has_tv
      t.boolean :has_kitchen
      t.boolean :has_air_conditioner
      t.boolean :has_internet
      t.boolean :has_study_room
      t.boolean :has_meals
      t.integer :price_per_day
      t.integer :price
      t.datetime :published_at
      t.integer :user_id
      t.string :latitude
      t.string :longitude
      t.string :image_url_1
      t.string :image_url_2
      t.string :image_url_3
      t.string :image_url_4
      t.string :image_url_5
      t.timestamps
    end
  end
end
