class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|

      t.integer :travel_start
      t.integer :travel_finish
      t.string :travel_title
      t.string :destination
      t.string :open,:default => false

      t.timestamps
    end
  end
end
