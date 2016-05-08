class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :status, default: Cart.statuses[:in_cart]

      t.timestamps
    end
  end
end
