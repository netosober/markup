module Markup
  class MaterialMarkup
    attr_reader :material_rates
    def initialize(material_rates={})
      @material_rates = material_rates
    end
  end
end
