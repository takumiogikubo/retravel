class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      
      t.references :customer, type: :bigint,foreign_key:true
      t.references :travel,foreign_key:true
      t.string :review,null: false, default: ""
      
      t.timestamps
    end
  end
end
