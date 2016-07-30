module Robotoy
  module Services
    class Orientation

      def initialize(robot:)
        @orients = [:north, :east, :south, :west]
        @robot = robot
        order_orients
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

