require_relative './line_item'

class LineItemBuilder

  def initialize(file)
    @file = file
  end

  def return_formatted_data
    File.open(@file).each_with_object([]) do |line, array|
      @line = line
      array << build_line_item
    end
  end

  private

  attr_reader :file

  def build_line_item
    LineItem.new({

                   description: return_item_description,
                   quantity: return_quantity,
                   price: return_price,
                   imported: return_imported,
                   type: return_type
                 })
  end

  def return_quantity
    /^\d+/.match(@line).to_s.to_i
  end

  def return_price
    /(?<=at\s)\d+.\d+/.match(@line).to_s.to_f
  end

  def return_item_description
    /(?<=\d\s).*(?=\sat)/.match(@line).to_s
  end

  def return_imported
    return_item_description.include?('imported')
  end

  def return_type
    @description = return_item_description
    if description_indicates_food
      :food
    elsif description_indicates_medicine
      :medicine
    elsif description_indicates_book
      :book
    else
      :other
    end
  end

  def description_indicates_food
    @description.include?('chocolate')
  end

  def description_indicates_medicine
    @description.include?('pills')
  end

  def description_indicates_book
    @description.include?('book')
  end

end