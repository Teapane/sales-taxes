require_relative './tax_calculator'

class LineItem

  attr_reader :description, :quantity, :price, :imported, :type, :tax_rate, :price_with_tax

  def initialize(options)
    @quantity = options[:quantity]
    @price = options[:price]
    @imported = options[:imported]
    @type = options[:type]
    @description = options[:description]
    @tax_rate = determine_tax_rate(options[:imported], options[:type])
    @price_with_tax = TaxCalculator.return_amount_with_tax(self)
  end

  private

  def determine_tax_rate(imported, type)
    if imported && type == :other
      15
    elsif type == :other
      10
    elsif imported
      5
    else
      0
    end
  end

end