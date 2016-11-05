module Robotoy
  class Game
    def initialize(robot: Robot.new, table: Table.new, move: Services::Move, place: Services::Place, orientation: Services::Orientation, report: Services::Report)
      @robot = robot
      @table = table
      @move = move
      @place = place
      @orientation = orientation
      @report = report
    end

    def perform(method, *args)
      send(method.downcase, *args.flatten)
      @action.perform
    rescue Errors => e
      puts e.message
    end

    private

    def place(x, y, orient)
      @action = @place.new(robot: @robot, table: @table, x: x, y: y, orient: orient)
    end

    def move(*_args)
      @action = @move.new(robot: @robot, table: @table)
    end

    def left(*_args)
      @action = @orientation.new(robot: @robot, side: :left)
    end

    def right(*_args)
      @action = @orientation.new(robot: @robot, side: :right)
    end

    def report(*_args)
      @action = @report.new(robot: @robot)
    end

    def method_missing(name, *args)
      raise Robotoy::NotValidMethodError
    end
  end
end
