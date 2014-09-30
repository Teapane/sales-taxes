require_relative './line_item_collection_builder'

def parse_file(file)
  LineItemCollectionBuilder.new(file).return_formatted_data
end

def total_sales_taxes(input)
  input.inject(0) { |memo, hash| memo += (hash.price_with_tax - hash.price) }.round(2).to_s
end

def total_all_items(input)
  input.inject(0) { |memo, hash| memo += hash.price_with_tax }.round(2).to_s
end

@data = [parse_file('data/input1.txt'), parse_file('data/input2.txt'), parse_file('data/input3.txt')]

@data.each_with_index do |input, index|
  puts "Output #{index + 1}:"

  input.each do |line_item|
    puts "#{line_item.quantity} #{line_item.description}: #{line_item.price_with_tax}"
  end

  puts "Sales Taxes: " + total_sales_taxes(input)
  puts "Total: " + total_all_items(input)
  puts ''
end


