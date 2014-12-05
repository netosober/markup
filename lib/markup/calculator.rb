module Markup
  class Calculator
    attr_reader :flat_rate, :worker_markup

    def initialize(flat_rate, worker_markup)
      if (flat_rate < 0)
        raise "flat_rate cannot be negative"
      end

      @worker_markup = worker_markup
      @flat_rate = flat_rate
    end

    def process(price, workers_quantity)
      if (price<0)
        raise "Price cannot be negative"
      end
      subtotal = price + price * @flat_rate

      worker_markup_result = @worker_markup.calculate(subtotal, workers_quantity)

      subtotal + worker_markup_result
    end
  end
end
