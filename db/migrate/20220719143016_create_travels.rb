class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|

      t.bigint :customer_id, foreign_key: true
      t.bigint :travel_detail_id, foreign_key: true
      t.date :travel_start, null: false
      t.date :travel_finish, null: false
      t.string :travel_title, null: false, default: ""
      t.integer :destination, null: false, default: "13"
      t.boolean :open, null: false, default: false

      t.timestamps
    end
  end
end
