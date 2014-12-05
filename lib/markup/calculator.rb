module Markup
  class Calculator
    def process(price)
      if (price<0)
        raise "Price cannot be negative"
      end
      price * 1.05
    end
  end
end
