module Pythagoras
  module Floats

    DEFAULT_ZERO_LIMIT = 0.0010

    # helps with low precision math near zero by clipping to a threshold
    def self.zero_out f, zero_limit = DEFAULT_ZERO_LIMIT
      if f.abs < zero_limit && f.abs > 0.0000 
        0.0000
      else
        f
      end
    end
  end
end