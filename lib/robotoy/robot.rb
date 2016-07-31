module Robotoy
  class Robot
    attr_accessor :x, :y, :orientation, :orients

    def initialize(orients: [:north, :east, :south, :west])
      @orients = orients
    end

    def validate_if_placed
      raise NotPlacedError if @x.nil? || @y.nil?
    end

    def validate_orientation(orientation:)
      raise NotValidOrientationError unless @orients.include?(orientation.downcase)
    end
  end
end
