module Robotoy
  class Robot

    attr_accessor :x, :y, :orientation

    def validate_if_placed
       raise NotPlacedError if x.nil? or y.nil?
    end
  end
end
