require 'spec_helper'

module Markup
  describe MaterialMarkup do
    let(:material_rates) { { "drugs" => 0.075, "food" => 0.13, "electronics" => 0.02 } }
    let(:material_markup) { MaterialMarkup.new material_rates }

    describe "#initialize" do
      it "sets material rates" do
        expect(material_markup.material_rates).to eql(material_rates)
      end
      it "sets empty rates for no parameter" do
        no_rates_material_markup = MaterialMarkup.new
        expect(no_rates_material_markup.material_rates).to eq({})
      end
    end
    describe "#calculate" do
      it "returns markup for known material" do
        result = material_markup.calculate(100, "drugs")
        expect(result).to within(0.01).of(7.5)
      end
      it "returns 0 markup for unknown material" do
        result = material_markup.calculate(100, "air")
        expect(result).to eq(0)
      end
      it "raises error if price is negative" do
        expect {material_markup.calculate(-1, "drugs")}.to raise_error
      end
    end
  end
end
