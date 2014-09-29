require 'line_item'

describe LineItem do

  describe 'initialize' do
    let(:imported_book) { LineItem.new(imported:true, type: :book, price: 14.99) }
    let(:imported_other) { LineItem.new(imported:true, type: :other, price: 14.99)}
    let(:non_imported_book) {LineItem.new(imported:false, type: :book, price: 14.99)}
    let(:non_imported_other) {LineItem.new(imported:false, type: :other, price: 14.99)}

    it 'returns the appropriate tax_rate' do
      expect(imported_book.tax_rate).to eq(5)
      expect(imported_other.tax_rate).to eq(15)
      expect(non_imported_book.tax_rate).to eq(0)
      expect(non_imported_other.tax_rate).to eq(10)
    end

  end

end