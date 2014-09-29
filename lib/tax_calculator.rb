class TaxCalculator

  def initialize(line_item)
    @line_item = line_item
  end

  def return_amount_with_tax
    (line_item.price + calculate_sales_tax).round(2)
  end

  private

  attr_reader :line_item

  def calculate_sales_tax
    tax = (line_item.price * line_item.tax_rate) / 100.0
    round_to_nearest_05(tax)
  end

  def round_to_nearest_05(value)
    ((value * 20.0).ceil / 20.0)
  end


end