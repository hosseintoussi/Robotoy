module Robotoy
  class Robot

    attr_accessor :x, :y, :orientation

    def report
      "#{@x}, #{@y}, #{@orientation}"
    end
  end
end
