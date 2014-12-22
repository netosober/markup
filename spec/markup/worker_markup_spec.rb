require 'spec_helper'

module Markup
  describe WorkerMarkup do
    let(:worker_markup) {WorkerMarkup.new 0.012}

    describe "#initialize" do
      it "set a worker rate" do
        expect(worker_markup.worker_rate).to eq(0.012)
      end
      it "raises error with negative rate" do
        expect {WorkerMarkup.new(-1)}.to raise_error("worker_rate cannot be negative")
      end
    end
    describe "#calculate" do
      it "returns markup for one worker" do
        order = Order.new(100, 1, 'drugs')
        result = worker_markup.calculate(order.price, order)
        expect(result).to be_within(0.01).of(1.2)
      end
      it "returns markup for three workers" do
        order = Order.new(100, 3, 'drugs')
        result = worker_markup.calculate(order.price, order)
        expect(result).to be_within(0.01).of(3.6)
      end
    end
  end
end
