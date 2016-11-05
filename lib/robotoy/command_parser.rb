module Robotoy
  class CommandParser
    def initialize(game: Game.new, commands: ARGF)
      @game = game
      @commands = commands
    end

    def perform
      @commands.each_line do |command|
        begin
          next if command.strip.empty?
          puts command
          set_params(command)
          @game.perform(@method, @args)
        rescue Errors => e
          puts e.message
        end
      end
    end

    private

    def set_params(command)
      splitted = command.split(/\s+/)
      @method = splitted[0].strip
      @args = splitted[1].split(',').map(&:strip) if splitted[1]
    end
  end
end
