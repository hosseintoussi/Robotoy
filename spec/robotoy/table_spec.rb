require "spec_helper"

describe Robotoy::Table do
  describe ".new" do
    context "when initializing table" do
      it "has the default valus of x and y" do
        table = described_class.new

        expect(table.x).to eq(4)
        expect(table.y).to eq(4)
      end
    end
  end

  describe "#validate_next_position" do
    context "when validating next position on the table" do
      it "raises error if position is invalid" do
        table = described_class.new

        expect{ table.validate_next_position(x: 6) }.to raise_error(Robotoy::NotValidMoveError)
      end
    end
  end
end
