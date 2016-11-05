require "spec_helper"

describe Robotoy::Services::Report do
  describe "#perform" do
    context "when perform called on placed robtot" do
      it "prints to STDOUT" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:validate_if_placed)
        allow(robot).to receive(:x).and_return(0)
        allow(robot).to receive(:y).and_return(0)
        allow(robot).to receive(:orientation).and_return(:north)

        report = described_class.new(robot: robot, type: :console)

        expect(STDOUT).to receive(:puts).with("Output: 0,0,NORTH")

        report.perform
      end
    end

    context "when perform called on placed robtot with string type" do
      it "returns a string of report" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:validate_if_placed)
        allow(robot).to receive(:x).and_return(0)
        allow(robot).to receive(:y).and_return(0)
        allow(robot).to receive(:orientation).and_return(:north)

        report = described_class.new(robot: robot, type: :string)

        expect(report.perform).to eq("0,0,NORTH")
      end
    end

    context "when perform called on placed robtot with an invalid type" do
      it "returns a string of report" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:validate_if_placed)
        allow(robot).to receive(:x).and_return(0)
        allow(robot).to receive(:y).and_return(0)
        allow(robot).to receive(:orientation).and_return(:north)

        report = described_class.new(robot: robot, type: :invalid)

        expect{ report.perform }.to raise_error(Robotoy::NotValidMethodError)
      end
    end
  end
end
