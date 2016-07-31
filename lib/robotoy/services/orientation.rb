module Robotoy
  module Services
    class Orientation
      def initialize(robot:, side:)
        @robot = robot
        @side = side
        order_orients
      end

      def perform
        send(@side)
      end

      private

      def right
        @robot.orientation = @robot.orients.rotate[0]
      end

      def left
        @robot.orientation = @robot.orients.rotate(-1)[0]
      end

      def order_orients
        return unless @robot.orientation
        index = @robot.orients.index(@robot.orientation)
        @robot.orients.rotate!(index)
      end
    end
  end
end

