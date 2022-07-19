class CreateTravelDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_details do |t|

      t.timestamps
    end
  end
end
