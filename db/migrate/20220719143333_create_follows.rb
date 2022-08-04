class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|

      t.references :customer,foreign_key:true
      t.references :relationship,foreign_key:{ to_table: :customers }

      t.timestamps

      t.index [:customer_id, :relationship_id], unique:true
    end
  end
end
