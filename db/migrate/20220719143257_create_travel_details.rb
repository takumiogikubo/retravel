class CreateTravelDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_details do |t|

      t.references :travel, type: :bigint,foreign_key:true
      t.date :travel_date,null: false
      t.string :travel_title_detail,null: false, default: ""
      t.time :start_time,null: false
      t.time :finish_time,null: false
      t.text :memo

      t.timestamps
    end
  end
end
