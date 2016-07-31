require "spec_helper"

describe Robotoy::Services::Orientation do
  describe "#perform" do
    context "when side is right" do
      it "calls right method" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation)

        orient = described_class.new(robot: robot, side: :right)

        expect(orient).to receive(:right)

        orient.perform
      end
    end

    context "when side is left" do
      it "calls left method" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation)

        orient = described_class.new(robot: robot, side: :left)

        expect(orient).to receive(:left)

        orient.perform
      end
    end
  end
end
