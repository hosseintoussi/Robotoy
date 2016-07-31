module Robotoy
  class Table
    attr_reader :x, :y

    def initialize(x: 4, y: 4)
      @x = x
      @y = y
    end

    def validate_next_position(x: 0, y: 0)
      raise NotValidMoveError unless x.between?(0, @x) && y.between?(0, @y)
    end
  end
end
