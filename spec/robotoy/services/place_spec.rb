require "spec_helper"

describe Robotoy::Services::Place do
  describe "#perform" do
    context "when move is valid" do
      it "calls x, y, and orientation on robot" do
        table = double(Robotoy::Table)
        allow(table).to receive(:validate_next_position)
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:validate_orientation)

        place = described_class.new(robot: robot, table: table,x: 0,y: 0, orient: :north)

        expect(robot).to receive(:x=).with(0)
        expect(robot).to receive(:y=).with(0)
        expect(robot).to receive(:orientation=).with(:north)

        place.perform
      end
    end
  end
end
