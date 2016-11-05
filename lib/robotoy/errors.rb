module Robotoy
  class Errors < StandardError
    def message
      "hmm.. Not sure what happened there!"
    end
  end

  class NotValidOrientationError < Errors
    def message
      "It looks like your Robot did not know there's such oriencation!"
    end
  end

  class NotValidMoveError < Errors
    def message
      "It wasn's a valisd move, unfortunately!"
    end
  end

  class NotPlacedError < Errors
    def message
      "Your Robot could not be placed!"
    end
  end

  class NotValidMethodError < Errors
    def message
      "I don't understand what you want me to do! :("
    end
  end
end
