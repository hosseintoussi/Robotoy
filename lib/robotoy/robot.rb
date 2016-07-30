module Robotoy
  class Robot
    attr_accessor :x, :y, :orientation

    def validate_if_placed
      raise NotPlacedError if @x.nil? || @y.nil?
    end
  end
end
