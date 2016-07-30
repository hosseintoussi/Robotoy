module Robotoy
  class Errors < StandardError; end
  class NotValidOrientationError < Errors; end
  class NotValidMoveError < Errors; end
  class NotPlacedError < Errors; end
  class NotValidMethodError < Errors; end
end

