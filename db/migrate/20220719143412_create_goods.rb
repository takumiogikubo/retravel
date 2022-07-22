class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|

      t.references :customer,foreign_key:true
      t.references :travel,foreign_key:true

      t.timestamps
    end
  end
end
