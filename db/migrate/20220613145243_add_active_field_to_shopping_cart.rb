class AddActiveFieldToShoppingCart < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_carts, :active, :boolean, before: :created_at
  end
end
