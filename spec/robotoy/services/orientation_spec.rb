require "spec_helper"

describe Robotoy::Services::Orientation do
  describe ".new" do
    context "when initializing a robot with orientation" do
      it "reorder the orients according to the robot" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation).and_return(:east)

        orient = described_class.new(robot: robot)

        expect(orient.instance_variable_get("@orients")[0]).to eq(:east)
      end
    end

    context "when initializing a not placed robot" do
      it "does not reorder orients" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation)

        orient = described_class.new(robot: robot)

        expect(orient.instance_variable_get("@orients")[0]).to eq(:north)
      end
    end
  end

  describe "#perform" do
    context "when side is right" do
      it "calls right method" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation)

        orient = described_class.new(robot: robot)

        expect(orient).to receive(:right)

        orient.perform(side: :right)
      end
    end

    context "when side is left" do
      it "calls left method" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation)

        orient = described_class.new(robot: robot)

        expect(orient).to receive(:left)

        orient.perform(side: :left)
      end
    end
  end

  describe "#validate_orientation" do
    context "when orientation is invalid" do
      it "raises not valid orientation error" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation)

        orient = described_class.new(robot: robot)

        expect{ orient.validate_orientation(orientation: :test) }.to raise_error(Robotoy::NotValidOrientationError)
      end
    end
  end
end
