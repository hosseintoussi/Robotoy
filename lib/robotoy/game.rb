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
    end

    private

    def place(x, y, orient)
      @place.new(robot: @robot, table: @table, x: x, y: y, orient: orient).perform
    end

    def move(range)
      @move.new(robot: @robot, table: @table, range: range || 1).perform
    end

    def left(*_args)
      @orientation.new(robot: @robot, side: :left).perform
    end

    def right(*_args)
      @orientation.new(robot: @robot, side: :right).perform
    end

    def report(type = :console)
      @report.new(robot: @robot).perform(type: type)
    end

    def method_missing(_name, *_args)
      raise Robotoy::NotValidMethodError
    end
  end
end
