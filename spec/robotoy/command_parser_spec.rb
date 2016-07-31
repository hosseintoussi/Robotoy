require "spec_helper"

describe Robotoy::CommandParser do
  describe "#perform" do
    context "when performed on place" do
      it "sends the correct method and params to game" do
        game = double(Robotoy::Game)
        commands = "PLACE 0,0,NORTH"

        command =  described_class.new(game: game, commands: commands)

        expect(game).to receive(:perform).with("PLACE", ["0", "0", "NORTH"])

        command.perform
      end
    end

    context "when performed on move" do
      it "sends the correct method and no params" do
        game = double(Robotoy::Game)
        commands = "MOVE"

        command =  described_class.new(game: game, commands: commands)

        expect(game).to receive(:perform).with("MOVE", nil)

        command.perform
      end
    end
  end
end
