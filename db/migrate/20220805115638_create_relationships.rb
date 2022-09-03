class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|

    t.references :customer, type: :bigint, foreign_key: true
     t.references :follow,  type: :bigint,foreign_key: { to_table: :customers }
     t.timestamps
     t.index [:customer_id, :follow_id], unique: true

    end
  end
end
