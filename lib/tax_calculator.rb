class TaxCalculator

  def self.return_amount_with_tax(line_item)
    price = line_item.price || 0
    rate = line_item.tax_rate
    (price + calculate_sales_tax(price: price, rate: rate)).round(2)
  end

  private

  class << self

    def calculate_sales_tax(options)
      defaults = {price: 0, rate: 0}
      defaults.merge!(options)
      tax = (defaults.fetch(:price) * defaults.fetch(:rate)) / 100.0
      round_to_nearest_05(tax)
    end

    def round_to_nearest_05(value)
      ((value * 20.0).ceil / 20.0)
    end

  end

end