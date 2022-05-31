# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  price       :decimal(10, 2)
#  stock       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord

    before_save :notify_product_saving
    after_save :notify_product_info

    before_update :out_of_stock, if: :stock_changed?

    def stock_changed?
        self.stock_was != self.stock && self.stock < 5
    end

    def out_of_stock
        puts "- Product #{self.name} stock decreased -"
    end

    def notify_product_saving
        puts "- Product #{self.name} saved -"
    end

    def notify_product_info
        puts "- Product #{self.name} stored in the warehouse -"
    end

end
