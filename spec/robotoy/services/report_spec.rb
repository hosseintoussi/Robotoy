require "spec_helper"

describe Robotoy::Services::Report do
  describe "#perform" do
    context "when perform called on placed robtot" do
      it "returns a string" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:validate_if_placed)
        allow(robot).to receive(:x).and_return(0)
        allow(robot).to receive(:y).and_return(0)
        allow(robot).to receive(:orientation).and_return(:north)

        report = described_class.new(robot: robot)

        expect(report.perform).to eq("0,0,NORTH")
      end
    end
  end
end
