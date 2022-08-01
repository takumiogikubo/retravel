class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|

      t.references :customer,foreign_key:true
      t.references :travel_detail,foreign_key:true
      t.date :travel_start,null: false, default: ""
      t.date :travel_finish,null: false, default: ""
      t.string :travel_title,null: false, default: ""
      t.integer :destination,null: false, default: ""
      t.boolean :open, null: false, default: false

      t.timestamps
    end
  end
end
