module Markup
  class MaterialMarkup
    attr_reader :material_rates

    def initialize(material_rates={})
      @material_rates = material_rates
    end

    def calculate(subtotal, order)
      rate = material_rates[order.material_type]
      if rate
        subtotal*rate
      else
        0
      end
    end
  end
end
