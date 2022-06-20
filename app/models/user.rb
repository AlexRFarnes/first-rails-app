# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  password   :text
#  token      :text
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    # has_one :shopping_cart
    has_many :shopping_carts
    has_one :shopping_cart, -> { where(active: true) }
end
