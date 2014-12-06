module Markup
  class MaterialMarkup
    attr_reader :material_rates

    def initialize(material_rates={})
      @material_rates = material_rates
    end

    def calculate(price, material)
      if (price < 0)
        raise "price cannot be negative"
      end

      rate = material_rates[material]
      if rate
        price*rate
      else
        0
      end
    end
  end
end
