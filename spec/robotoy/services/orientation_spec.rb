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

  describe "#right" do
    context "when right called on orientation" do
      it "rotates right" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation)

        orient = described_class.new(robot: robot)

        expect(robot).to receive(:orientation=).with(:east)

        orient.right
      end
    end
  end

  describe "#left" do
    context "when left called on orientation" do
      it "rotates left" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation)

        orient = described_class.new(robot: robot)

        expect(robot).to receive(:orientation=).with(:west)

        orient.left
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
