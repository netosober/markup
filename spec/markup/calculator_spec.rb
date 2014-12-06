require 'spec_helper'

module Markup
  describe Calculator do
    let(:worker_markup) {double("WorkerMarkup")}
    let(:material_markup) {double("MaterialMarkup")}

    let(:calculator) {Calculator.new 0.05, worker_markup, material_markup }
    let(:zero_rate_calculator) {Calculator.new 0, worker_markup, material_markup }

    describe "#process" do
      let(:price) {100}
      let(:workers_quantity) {3}
      let(:material_type) {'food'}
      context "with normal rate of 5%" do
        before(:each) do
          allow(worker_markup).to receive(:calculate).with(105, workers_quantity) { 0 }
          allow(material_markup).to receive(:calculate).with(105, material_type) { 0 }
        end

        it "applies a flat rate" do
          result = calculator.process(price, workers_quantity, material_type)
          expect(result).to eq(105)
        end
        it "raises error with negative input" do
          expect {calculator.process(-1, 3, "material")}.to raise_error
        end
        it "calls worker_markup#calculate with 105 price and 3 workers" do
          expect(worker_markup).to receive(:calculate).with(105, 3)
          calculator.process(price, workers_quantity, material_type)
        end
        it "adds the result of worker_markup#calculate to price + flat markup" do
          allow(worker_markup).to receive(:calculate).with(105, 3) {5}
          result = calculator.process(price, workers_quantity, material_type)
          expect(result).to eq(110)
        end
        it "calls material_markup#calculate with 105 price and 'food' material" do
          expect(material_markup).to receive(:calculate).with(105, material_type)
          calculator.process(price, workers_quantity, material_type)
        end
        it "adds the result of worker_markup#calculate to price + flat markup" do
          allow(material_markup).to receive(:calculate).with(105, material_type) {5}
          result = calculator.process(price, workers_quantity, material_type)
          expect(result).to eq(110)
        end
      end
      context "with flat rate of 0" do
        before(:each) do
          allow(worker_markup).to receive(:calculate).with(100, workers_quantity) { 0 }
          allow(material_markup).to receive(:calculate).with(100, material_type) { 0 }
        end

        it "doesn't increase the price" do
          result = zero_rate_calculator.process(price, workers_quantity, material_type)
          expect(result).to eq(price)
        end
      end
    end
    describe "#initialize" do
      it "set a flat rate" do
        expect(calculator.flat_rate).to eq 0.05
      end
      it "raises error with negative flat rate" do
        expect {Calculator.new(-1, worker_markup)}.to raise_error
      end
      it "set a worker_markup" do
        expect(calculator.worker_markup).to eql(worker_markup)
      end
    end
  end
end
