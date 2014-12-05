require 'spec_helper'

module Markup
  describe WorkerMarkup do
    let(:worker_markup) {WorkerMarkup.new 0.012}
    let(:price) {100}

    describe "#initialize" do
      it "set a worker rate" do
        expect(worker_markup.worker_rate).to eq(0.012)
      end
      it "raises error with negative rate" do
        expect {WorkerMarkup.new(-1)}.to raise_error
      end
    end
    describe "#calculate" do
      it "returns markup for one worker" do
        result = worker_markup.calculate(price, 1)
        expect(result).to be_within(0.01).of(1.2)
      end
      it "returns markup for one worker" do
        result = worker_markup.calculate(price, 3)
        expect(result).to be_within(0.01).of(3.6)
      end
      it "raises error with negative price" do
        expect {worker_markup.calculate(-1,1)}.to raise_error
      end
      it "raises error with negative workers quantity" do
        expect {worker_markup.calculate(1,-1)}.to raise_error
      end
    end
  end
end
