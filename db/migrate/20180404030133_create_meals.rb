class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :dish_id
      t.integer :venue_id
      t.integer :neighborhood_id

      t.timestamps

    end
  end
end
