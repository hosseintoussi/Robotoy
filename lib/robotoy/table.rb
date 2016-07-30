module Robotoy
  class Table

    attr_reader :x, :y

    def initialize(x: 5, y: 5)
      @x = x
      @y = y
    end

    def validate_next_position(x: 0, y: 0)
      raise unless x.between?(0, @x) and y.between?(0, @y)
    end
  end
end
