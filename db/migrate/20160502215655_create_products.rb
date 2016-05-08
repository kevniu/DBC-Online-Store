class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.money :price
      t.integer :quantity
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
