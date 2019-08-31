module Pythagoras

  module Angles

    # Converts a value in degrees to radians
    def self.to_rad degrees 
      degrees * Math::PI / 180.0
    end

    def self.to_degrees radians
      180.0 * radians / Math::PI 
    end
  end
end