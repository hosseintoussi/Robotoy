module Robotoy
  module Services
    class Place
      def initialize(robot:, table:, x:, y:, orient:)
        @robot = robot
        @table = table
        @x = x.to_i
        @y = y.to_i
        @orient = orient.downcase.to_sym
      end

      def perform
        validate_placement(@x, @y, @orient)
        @robot.x = @x
        @robot.y = @y
        @robot.orientation = @orient
      end

      private

      def validate_placement(x, y, orientation)
        @table.validate_next_position(x: x, y: y)
        @robot.validate_orientation(orientation: orientation)
      end
    end
  end
end
