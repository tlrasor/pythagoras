module Pythagoras

  # This class is strictly 2d and immutable. All angles are in radians. See Angles#o_rad for converting from degrees.
  # 
  # For more info on the vector math, see: http://geomalgorithms.com/vector_products.html
  class Vect2

    attr_reader :x, :y
    
    def initialize x=0, y=0
      @x = x 
      @y = y 
    end

    ZERO = Vect2.new(0, 0).freeze

    def self.zero
      ZERO
    end

    # Angle in radians, relative to x-axis
    def self.from angle, magnitude=1
      Vect2.new(magnitude * Math.cos(angle),
                magnitude * Math.sin(angle))
    end

    def to_s
      "(#{x},#{y})"
    end

    def == v
      @x == v.x &&
      @y == v.y
    end

    def add v
      Vect2.new((@x+v.x), (@y+v.y))
    end
    alias_method :+, :add

    def subtract v
      Vect2.new((@x-v.x), (@y-v.y))
    end
    alias_method :-, :subtract
    
    def scale s
      Vect2.new(@x*s, @y*s)
    end
    alias_method :*, :scale

    def magnitude 
      return 0 if (@x.zero? && @y.zero?)
      @mag ||= Math.hypot(@x, @y)
    end
    alias_method :length, :magnitude
    alias_method :mag, :magnitude

    # also known as a scalar product
    def dot v
      @x*v.x + @y*v.y
    end

    # 2d perp operator, returns a vector perpendicular to this one. 
    def perp
      Vect2.new(-@y, @x)
    end

    # simulates a cross product. Generally, the cross product is a vector but in 2d 
    # the cross product only has a z-component so we only return a scalar. Additionally,
    # we derive the cross product using the perpdot, it equals the area of the 
    # parallelogram covered by the two vectors
    def perpdot v
      (@x * v.y) - (@y * v.x)
    end
    alias_method :cross, :perpdot

    # Calculates the angle in radians between two vectors
    def angle_between v
      pdotp = perpdot(v)
      dotp = dot(v)
      Math.atan2(pdotp, dotp)
    end

    def normalize
      return ZERO unless magnitude > 0
      return Vect2.new(@x/magnitude, @y/magnitude)
    end

    def zero_out
      Vect2.new(Floats.zero_out(@x), Floats.zero_out(@y))
    end

  end
end