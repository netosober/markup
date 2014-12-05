require 'spec_helper'

module Markup
  describe Calculator do
    let(:calculator) {Calculator.new 0.05}
    let(:zero_rate_calculator) {Calculator.new 0}

    describe "#process" do
      let(:price) {100}
      context "with normal rate of 5%" do
        it "applies a flat rate" do
          result = calculator.process price
          expect(result).to eq(105)
        end
        it "raises error with negative input" do
          expect {calculator.process(-1)}.to raise_error
        end
      end
      context "with flat rate of 0" do
        it "doesn't increase the price" do
          result = zero_rate_calculator.process price
          expect(result).to eq(price)
        end
      end
    end
    describe "#initialize" do
      it "set a flat rate" do
        expect(calculator.flat_rate).to eq 0.05
      end
      it "raises error with negative flat rate" do
        expect {Calculator.new -1}.to raise_error
      end
    end
  end
end
