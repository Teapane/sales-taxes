require_relative './line_item'

class LineItemBuilder

  def initialize(file)
    @file = file
  end

  def return_formatted_data
    File.open(@file).each_with_object([]) do |line, array|
      array << build_line_item(line)
    end
  end

  private

  attr_reader :file

  def build_line_item(line)
    LineItem.new({
                   description: return_item_description(line),
                   quantity: return_quantity(line),
                   price: return_price(line),
                   imported: return_imported(line),
                   type: return_type(line)
                 })
  end

  def return_quantity(line)
    /^\d+/.match(line).to_s.to_i
  end

  def return_price(line)
    /(?<=at\s)\d+.\d+/.match(line).to_s.to_f
  end

  def return_item_description(line)
    /(?<=\d\s).*(?=\sat)/.match(line).to_s
  end

  def return_imported(line)
    return_item_description(line).include?('imported')
  end

  def return_type(line)
    description = return_item_description(line)
    if description_indicates_food(description)
      :food
    elsif description_indicates_medicine(description)
      :medicine
    elsif description_indicates_book(description)
      :book
    else
      :other
    end
  end

  def description_indicates_food(description)
    description.include?('chocolate')
  end

  def description_indicates_medicine(description)
    description.include?('pills')
  end

  def description_indicates_book(description)
    description.include?('book')
  end

end