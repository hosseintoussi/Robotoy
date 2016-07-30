module Robotoy
  module Services
    class Orientation

      def initialize(robot:)
        @orients = [:north, :east, :south, :west]
        @robot = robot
        order_orients
      end

      def right
        @robot.orientation = @orients.rotate[0]
      end

      def left
        @robot.orientation = @orients.rotate(-1)[0]
      end

      def validate_orientation(orientation:)
        raise NotValidOrientationError unless @orients.include?(orientation.downcase)
      end


      private

      def order_orients
        return unless @robot.orientation
        index = @orients.index(@robot.orientation)
        @orients.rotate!(index)
      end
    end
  end
end

