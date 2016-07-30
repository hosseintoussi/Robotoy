module Robotoy
  module Services
    class Place

      def initialize(robot:, table:, orientation:)
        @robot = robot
        @table = table
        @orientation = orientation
      end

      def perform(x:, y:, orientation:)
        validate_placement(x, y, orientation)
        @robot.x = x
        @robot.y = y
        @robot.orientation = orientation
      end

      private

      def validate_placement(x, y, orientation)
        @table.validate_next_position(x: x, y: y)
        @orientation.validate_orientation(orientation: orientation)
      end
    end
  end
end
