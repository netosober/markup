module Markup
  class Calculator
    attr_reader :flat_rate

    def initialize(flat_rate)
       if (flat_rate < 0)
        raise "flat_rate cannot be negative"
      end

      @flat_rate = flat_rate
    end

    def process(price)
      if (price<0)
        raise "Price cannot be negative"
      end
      price * 1.05
    end
  end
end
