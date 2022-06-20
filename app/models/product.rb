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
class Product < ApplicationRecord

    belongs_to :category

    before_save :notify_product_saving
    after_save :notify_product_info

    before_update :out_of_stock, if: :stock_changed?
    before_update :notify_different_price, if: :price_is_changed?

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

    # Scopes (like class methods but shorter syntax)
    scope :product_sum, -> { sum(:price) }
    scope :desc_ordered_by_price, -> { order(price: :desc) }
    scope :availables, -> { where('stock > ?', 0)}
    scope :cheaper_products, -> (price) { where('price < ?', price) }

    # Class Methods
    def self.top_cheap_products(limit=nil)
        order(price: :asc).limit(limit).select(:name, :price)
    end

    # Instance Methods

    def notify_different_price
        puts "- Product #{name}'s price changed -"
    end

    def out_of_stock
        puts "- Product #{self.name}'s stock decreased -"
    end

    def notify_product_saving
        puts "- Product #{self.name} was saved -"
    end

    def notify_product_info
        puts "- Product #{self.name} was stored in the warehouse -"
    end

    def description_length_validate
        unless description.length >= 10
            errors.add(:description, "Description must be at least 10 characters long")
        end
    end

    def price_is_changed?
        price_was != price
    end

end
