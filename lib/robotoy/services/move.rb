module Robotoy
  module Services
    class Move

      def initialize(robot:, table:, x_range: 1, y_range: 1)
        @robot = robot
        @table = table
        @x_range = x_range
        @y_range = y_range
      end

      def perform
        send(@robot.orientation)
      end

      private

      def north
        @table.validate_next_position(y: @robot.y + @y_range)
        @robot.y += @y_range
      end

      def south
        @table.validate_next_position(y: @robot.y - @y_range)
        @robot.y -= @y_range
      end

      def east
        @table.validate_next_position(x: @robot.x + @x_range)
        @robot.x += @x_range
      end

      def west
        @table.validate_next_position(x: @robot.x - @x_range)
        @robot.x -= @x_range
      end

      def method_missing(name, *args)
        raise Robotoy::NotValidMethodError
      end
    end
  end
end
