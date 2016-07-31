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
      send(method, *args)
    end

    private

    def place(x, y, orient)
      orientation = @orientation.new(robot: @robot)
      placer = @place.new(robot: @robot, table: @table, orientation: orientation)
      placer.perform(x: x, y: y, orientation: orient)
    rescue NotValidMoveError
      "Not a valid place unfortunately"
    rescue NotValidOrientationError
      "Not a valid orientation unfortunately"
    end

    def move(*_args)
      mover = @move.new(robot: @robot, table: @table)
      mover.perform
    rescue NotValidMoveError
      "Not a valid move unfortunately"
    rescue NotPlacedError
      "Not placed yet"
    end

    def left(*_args)
      orientation = @orientation.new(robot: @robot)
      orientation.perform(side: :left)
    end

    def right(*_args)
      orientation = @orientation.new(robot: @robot)
      orientation.perform(side: :right)
    end

    def report(*_args)
      reporter = @report.new(robot: @robot)
      reporter.perform
    rescue NotPlacedError
      "Not placed yet"
    end

    def method_missing(name, *args)
      raise Robotoy::NotValidMethodError
    end
  end
end
