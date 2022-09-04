class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|

      t.bigint :customer, foreign_key: true
      t.bigint :travel, foreign_key: true

      t.timestamps
    end
  end
end
