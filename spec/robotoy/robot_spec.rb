require "spec_helper"

describe Robotoy::Robot do
  describe "#validate_if_placed" do
    context "robot is not placed" do
      it "raises not placed error" do
        robot = described_class.new

        expect{ robot.validate_if_placed }.to raise_error(Robotoy::NotPlacedError)
      end
    end
  end
end
