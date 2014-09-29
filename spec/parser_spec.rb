require 'parser'

describe Parser do

  before(:each) do
    @file = './spec/test_data/test_input1.txt'
  end

  describe 'parse_file_and_return_data' do

    let(:parsed_file) {Parser.parse_file_and_return_data(@file)}
    let (:line_item_sample) {Parser.parse_file_and_return_data(@file).first}

    it 'reads file with appropriate input and returns array of line items' do
      expect(parsed_file).to be_instance_of(Array)
      expect(parsed_file.first).to be_instance_of(LineItem)
    end

    it 'reads file and parses it appropriately' do
      expect(line_item_sample.description).to eq('imported bottle of perfume')
      expect(line_item_sample.price).to eq(27.99)
      expect(line_item_sample.quantity).to eq(1)
    end

  end

end