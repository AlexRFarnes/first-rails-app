class RemoveActiveFromShoppingCart < ActiveRecord::Migration[6.1]
  def change
    remove_column :shopping_carts, :active, :boolean
  end
end
