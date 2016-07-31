module Robotoy
  module Services
    class Report
      def initialize(robot:)
        @robot = robot
      end

      def perform(type: :string)
        @robot.validate_if_placed
        send(type)
      end

      private

      def string
        puts "#{@robot.x},#{@robot.y},#{@robot.orientation.upcase}"
      end
    end
  end
end
