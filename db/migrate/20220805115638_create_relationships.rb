class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|

     t.bigint :customer_id, foreign_key: true
     t.bigint :follow, foreign_key: { to_table: :customers }
     t.timestamps
     t.index [:customer_id, :follow_id], unique: true

    end
  end
end
