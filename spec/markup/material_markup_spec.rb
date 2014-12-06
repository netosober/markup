require 'spec_helper'

module Markup
  describe MaterialMarkup do
    describe "#initialize" do
      it "sets material rates" do
        material_rates =  { "drugs" => 0.075, "food" => 0.13, "electronics" => 0.02 }
        material_markup = MaterialMarkup.new material_rates
        expect(material_markup.material_rates).to eql(material_rates)
      end
      it "sets empty rates for no parameter" do
        no_rates_material_markup = MaterialMarkup.new
        expect(no_rates_material_markup.material_rates).to eq({})
      end
    end
  end
end
