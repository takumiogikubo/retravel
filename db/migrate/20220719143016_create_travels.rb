class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|

      t.date :travel_start
      t.date :travel_finish
      t.string :travel_title
      t.string :destination
      t.boolean :open, null: false, default: false

      t.timestamps
    end
  end
end
