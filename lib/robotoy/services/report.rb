module Robotoy
  module Services
    class Report
      def initialize(robot:)
        @robot = robot
      end

      def perform(type: :console)
        @robot.validate_if_placed
        send(type)
      end

      private

      def console
        puts "Output: #{string}"
      end

      def string
        "#{@robot.x},#{@robot.y},#{@robot.orientation.upcase}"
      end

      def method_missing(_name, *_args)
        raise Robotoy::NotValidMethodError
      end
    end
  end
end
