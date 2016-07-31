require "spec_helper"

describe Robotoy::Game do
  describe "#perform" do
    context "when a valid method is passed" do
      it "calls the method and passes the arguments" do
        robot = double(Robotoy::Robot)
        table = double(Robotoy::Table)
        move = double(Robotoy::Services::Move)
        place = double(Robotoy::Services::Place)
        allow(place).to receive(:perform)
        orientation = double(Robotoy::Services::Orientation)
        report = double(Robotoy::Services::Report)

        game = described_class.new(robot: robot, table: table, move: move, place: place, orientation: orientation, report: report)
        game.instance_variable_set(:@action, place)
        expect(game).to receive(:place).with(0, 0, :north).and_return('tes')

        game.perform(:place, 0, 0, :north)
      end
    end

    context "when an invalid message is passed" do
      it "rescues not valid method error" do
        robot = double(Robotoy::Robot)
        table = double(Robotoy::Table)
        move = double(Robotoy::Services::Move)
        place = double(Robotoy::Services::Place)
        orientation = double(Robotoy::Services::Orientation)
        report = double(Robotoy::Services::Report)

        game = described_class.new(robot: robot, table: table, move: move, place: place, orientation: orientation, report: report)

        expect{ game.perform(:invalid) }.not_to raise_error(Robotoy::NotValidMethodError)
      end
    end
  end
end
