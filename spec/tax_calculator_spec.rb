require 'tax_calculator'

describe TaxCalculator do

  describe 'calculate_sales' do
    it 'calculates sales tax given a shelf price and tax rate' do

      expect(TaxCalculator.calculate_sales_tax(price: 47.50, rate: 15)).to eq(7.15)
      expect(TaxCalculator.calculate_sales_tax(price: 14.99, rate: 10)).to eq(1.50)
      expect(TaxCalculator.calculate_sales_tax(price: 10, rate: 5)).to eq(0.50)
      expect(TaxCalculator.calculate_sales_tax(price: 11.25, rate: 5)).to eq(0.60)


    end
  end

end