module Markup
  class WorkerMarkup
    attr_reader :worker_rate

    def initialize(worker_rate)
      if (worker_rate < 0)
        raise "worker_rate cannot be negative"
      end

      @worker_rate = worker_rate
    end

    def calculate(price, workers_quantity)
      if (price < 0)
        raise "price cannot be negative"
      end
      if (workers_quantity < 0)
        raise "workers_quantity cannot be negative"
      end

      price*worker_rate*workers_quantity
    end
  end
end
