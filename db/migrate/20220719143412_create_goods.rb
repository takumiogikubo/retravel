class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|

      t.bigint :customer_id, foreign_key: true
      t.bigint :travel_id, foreign_key: true

      t.timestamps
    end
  end
end
