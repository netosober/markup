require 'spec_helper'

module Markup
  describe Order do
    describe "#new" do
      let(:order) { Order.new(1299.99, 3, 'food') }
      it "stores price" do
        expect(order.price).to eq(1299.99) 
      end
      it "stores worker quantity" do
        expect(order.workers_quantity).to eq(3)
      end
      it "stores material type" do
        expect(order.material_type).to eq('food')
      end
      it "changes to lowercase material type" do
        drugs_order = Order.new 12, 3, "Drugs"
        expect(drugs_order.material_type).to eq('drugs')
      end
      it "raises error for negative price" do
        expect {Order.new(-1, 2, 'food')}.to raise_error("price cannot be negative")
      end
      it "raises error for negative workers quantity" do
        expect {Order.new(2,-1, 'food')}.to raise_error("workers_quantity cannot be negative")
      end
    end
  end
end
