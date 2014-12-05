require 'spec_helper'

module Markup
  describe WorkerMarkup do
    let(:worker_markup) {WorkerMarkup.new 0.012}

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
        result = worker_markup.calculate(100, 1)
        expect(result).to eq(1.2)
      end
    end
  end
end
