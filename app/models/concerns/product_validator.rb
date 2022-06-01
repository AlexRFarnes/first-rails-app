class ProductValidator < ActiveModel::Validator

    def validate(record)
        validate_stock(record)
    end

    def validate_stock(record)
        if !record.stock.is_a? Integer
            record.errors.add(:stock, :invalid, message: "The stock value must be an integer.")
        end
    end

end