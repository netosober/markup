require 'spec_helper'

module Markup
  describe Calculator do
    let(:calculator) {Calculator.new}
    describe "#process" do
      it "applies a flat rate" do
        result = calculator.process 100
        expect(result).to eq(105)
      end
      it "raises error with negative input" do
        expect {calculator.process(-1)}.to raise_error
      end
    end
  end
end
