module Robotoy
  module Services
    class Move
      def initialize(robot:, table:, range:)
        @robot = robot
        @table = table
        @range = range.to_i
      end

      def perform
        @robot.validate_if_placed
        send(@robot.orientation)
      end

      private

      def north
        @table.validate_next_position(y: @robot.y + @range)
        @robot.y += @range
      end

      def south
        @table.validate_next_position(y: @robot.y - @range)
        @robot.y -= @range
      end

      def east
        @table.validate_next_position(x: @robot.x + @range)
        @robot.x += @range
      end

      def west
        @table.validate_next_position(x: @robot.x - @range)
        @robot.x -= @range
      end

      def method_missing(_name, *_args)
        raise Robotoy::NotValidMethodError
      end
    end
  end
end
