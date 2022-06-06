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
#
class Product < ApplicationRecord

    before_save :notify_product_saving
    after_save :notify_product_info

    before_update :out_of_stock, if: :stock_changed?

    def stock_changed?
        self.stock_was != self.stock && self.stock < 5
    end

    # Validations
    validates :name, presence: { message: "Description is empty or is incorrect, please enter a valid product name." }
    validates :description, presence: { message: "Description is empty or is incorrect, please enter a valid product description." }
    validates :stock, numericality: { greater_than_or_equal_to: 0, message: "The stock value is %{value}, it must be equal or greater than 0." }
    validates :price, numericality: { greater_than_or_equal_to: 1, message: "The stock value is %{value}, it must be equal or greater than 1." }
    # validates :stock, numericality: { only_integer: true , message: "The value of stock must be an integer."}
    
    validates_with ProductValidator

    validate :description_length_validate

    def out_of_stock
        puts "- Product #{self.name} stock decreased -"
    end

    def notify_product_saving
        puts "- Product #{self.name} saved -"
    end

    def notify_product_info
        puts "- Product #{self.name} stored in the warehouse -"
    end

    def description_length_validate
        unless description.length >= 10
            errors.add(:description, "Description must be at least 10 characters long")
        end
    end

end
