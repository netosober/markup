require 'spec_helper'

module Markup
  describe Calculator do
    let(:material_rates) { { "drugs" => 0.075, "food" => 0.13, "electronics" => 0.02 } }
    let(:material_markup) { MaterialMarkup.new material_rates }
    let(:worker_markup) {WorkerMarkup.new 0.012}
    let(:calculator) {Calculator.new 0.05, worker_markup, material_markup }
    describe "#process" do
      it "return $1591.58 for $1299.99 / 3 people / food" do
        expect(calculator.process(1299.99, 3, 'food')).to eq(1591.58)
      end
      it "return $6199.81 for $5432.00 / 1 person / drugs" do
        expect(calculator.process(5432.00, 1, 'drugs')).to eq(6199.81)
      end
      it "return $13707.63 for $12456.95 / 4 people / books" do
        expect(calculator.process(12456.95, 4, 'books')).to eq(13707.63)
      end
    end
  end
end

