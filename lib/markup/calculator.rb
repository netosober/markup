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

    def process(order)
      subtotal = order.price + order.price * @flat_rate
      worker_markup_result = @worker_markup.calculate(subtotal, order)
      material_markup_result = @material_markup.calculate(subtotal, order)
      total = subtotal + worker_markup_result + material_markup_result

      total.round(2)
    end
  end
end
