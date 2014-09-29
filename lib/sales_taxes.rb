require_relative './line_item_builder'

class SalesTaxes

  def initialize
    @data = [parse_file('data/input1.txt'), parse_file('data/input2.txt'), parse_file('data/input3.txt')]
  end

  def print_output
    @data.each_with_index do |input, index|
      puts "Output #{index + 1}:"
      input.each do |line_item|
        puts "#{line_item.quantity} #{line_item.description}: #{line_item.price_with_tax}"
      end
      puts "Sales Taxes: " + total_sales_taxes(input)
      puts "Total: " + total_all_items(input)
      puts ''
    end
  end

  private

  def parse_file(file)
    LineItemBuilder.new(file).return_formatted_data
  end

  def total_sales_taxes(input)
    input.inject(0) {|memo, hash| memo += (hash.price_with_tax - hash.price) }.round(2).to_s
  end

  def total_all_items(input)
    input.inject(0) {|memo, hash| memo += hash.price_with_tax }.round(2).to_s
  end

end

s = SalesTaxes.new
s.print_output