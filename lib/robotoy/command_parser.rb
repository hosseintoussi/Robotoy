module Robotoy
  class CommandParser
    def initialize(game: Game.new, commands: ARGF)
      @game = game
      @commands = commands
    end

    def perform
      @commands.each_line do |command|
        next if command.strip.empty?
        set_params(command)
        game.perform(@method, @args)
      end
    end

    private

    def set_params(command)
      splitted = command.split(/\s+/)
      @method = splitted.first.strip
      @@args = splitted.last.split(',').strip(:&)
    end
  end
end
