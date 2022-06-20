# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  code        :string
#  description :string
#  name        :string
#  price       :decimal(10, 2)
#  stock       :integer
#  uuid        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
