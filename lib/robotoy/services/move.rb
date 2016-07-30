module Robotoy
  module Services
    class Move

      def initialize(robot:, table:, x_range: 1, y_range: 1)
        @robot = robot
        @tabel = table
        @x_range = x_range
        @y_range = y_range
      end

      def perform
        send(@robot.orientation)
      end

      private

      def north
        @robot.y += @y_range
      end

      def south
        @robot.y -= @y_range
      end

      def east
        @robot.x += @x_range
      end

      def west
        @robot.x -= @x_range
      end

      def method_missing(name, *args)
        puts "Method #{name} does not exist."
      end
    end
  end
end
