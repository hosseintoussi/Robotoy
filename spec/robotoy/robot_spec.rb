require "spec_helper"

describe Robotoy::Robot do
  describe "#report" do
    context "when robot has a position" do
      it "returns the position of the robot" do
        robot = described_class.new

        robot.x = 0
        robot.y = 0
        robot.orientation = :north

        expect(robot.report).to eq("0, 0, north")
      end
    end
  end
end
