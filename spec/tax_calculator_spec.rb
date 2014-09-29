require 'tax_calculator'
require 'line_item'

describe TaxCalculator do

  describe 'calculate_sales' do

    let(:line_item) {LineItem.new(price: 47.50, imported: true, type: :other)}

    it 'calculates sales tax given a shelf price and tax rate' do

      expect(TaxCalculator.new(line_item).return_amount_with_tax).to eq(54.65)

    end
  end

end