# == Schema Information
#
# Table name: shopping_carts
#
#  id         :bigint           not null, primary key
#  active     :boolean
#  total      :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_shopping_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class ShoppingCart < ApplicationRecord
  belongs_to :user # user es un atributo al que se le puede pasar un objeto usuario o metodo para traer al usuario que es dueño del shopping cart
end
