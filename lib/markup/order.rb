module Markup
  class Order
    attr_reader :price, :workers_quantity, :material_type
    def initialize(price, workers_quantity, material_type)
      raise "price cannot be negative" if price < 0
      raise "workers_quantity cannot be negative" if workers_quantity < 0
      @price = price
      @workers_quantity = workers_quantity
      @material_type = material_type.downcase
    end
  end
end