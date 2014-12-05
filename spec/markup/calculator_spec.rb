require 'spec_helper'

module Markup
  describe Calculator do
    let(:calculator) {Calculator.new 0.5}
    describe "#process" do
      it "applies a flat rate" do
        result = calculator.process 100
        expect(result).to eq(105)
      end
      it "raises error with negative input" do
        expect {calculator.process(-1)}.to raise_error
      end
    end
    describe "#initialize" do
      it "set a flat rate" do
        expect(calculator.flat_rate).to eq 0.5
      end
      it "raises error with negative flat rate" do
        expect {Calculator.new -1}.to raise_error
      end
    end
  end
end
