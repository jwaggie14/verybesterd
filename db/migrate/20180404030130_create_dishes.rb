class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :dishes
      t.string :cuisine

      t.timestamps

    end
  end
end
