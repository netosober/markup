module Markup
  class Calculator
    attr_reader :flat_rate, :worker_markup, :material_markup

    def initialize(flat_rate, worker_markup, material_markup)
      if (flat_rate < 0)
        raise "flat_rate cannot be negative"
      end

      @worker_markup = worker_markup
      @material_markup = material_markup
      @flat_rate = flat_rate
    end

    def process(price, workers_quantity, material_type)
      if (price<0)
        raise "Price cannot be negative"
      end
      subtotal = price + price * @flat_rate

      worker_markup_result = @worker_markup.calculate(subtotal, workers_quantity)
      material_markup_result = @material_markup.calculate(subtotal, material_type)
      total = subtotal + worker_markup_result + material_markup_result

      total.round(2)
    end
  end
end
