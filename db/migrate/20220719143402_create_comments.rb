class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.bigint :customer_id, foreign_key: true
      t.bigint :travel, foreign_key: true
      t.string :review,null: false, default: ""

      t.timestamps
    end
  end
end
