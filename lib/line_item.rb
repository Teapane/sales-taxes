require_relative './tax_calculator'

class LineItem

  attr_reader :description, :quantity, :price, :imported, :type, :tax_rate, :price_with_tax

  def initialize(options)
    @quantity = options[:quantity]
    @price = options[:price]
    @imported = options[:imported]
    @type = options[:type]
    @description = options[:description]
    @tax_rate = determine_tax_rate
    @price_with_tax = TaxCalculator.new(self).return_amount_with_tax
  end

  private

  def determine_tax_rate
    if type == :other
      check_imported_for_other
    else
      check_imported_for_tax_free
    end
  end

  def check_imported_for_other
    imported ? 15 : 10
  end

  def check_imported_for_tax_free
    imported ? 5 : 0
  end

end