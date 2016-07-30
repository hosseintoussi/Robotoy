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
end
