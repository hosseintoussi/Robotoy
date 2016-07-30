require "spec_helper"

describe Robotoy::Table do
  describe ".new" do
    context "when initializing table" do
      it "has the default valus of x and y" do
        table = described_class.new

        expect(table.x).to eq(5)
        expect(table.y).to eq(5)
      end
    end
  end
end
