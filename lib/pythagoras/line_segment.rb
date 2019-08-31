module Pythagoras
  
  class LineSegment

    attr_reader :x1, :y1, :x2, :y2

    def initialize x1, y1, x2, y2
      @x1 = x1
      @y1 = y1
      @x2 = x2
      @y2 = y2
    end

    def self.from_vect2 v1, v2
      LineSegment.new(v1.x, v1.y, v2.x, v2.y)
    end

    def to_vect2
      Vect2.new(width, height)
    end

    def degenerate?
      @degenerate ||= (length == 0.0)
    end

    def width
      @width ||= (@x2 - @x1)
    end

    def height 
      @height ||= (@y2 - @y1)
    end

    def length
      @length ||= Math.hypot(@x2 - @x1, @y2 - @y1)
    end

    # Returns the nearest point on the line segment to point (x,y)
    # see: https://2dengine.com/?p=intersections#Nearest_point_on_a_segment
    def nearest_point x, y
      c2 = width**2 + height**2
      # arguably this is a fail condition but return point instead
      if c2 == 0
        [@x1, @y1]
      end

      px = x - @x1
      py = y - @y1
      u = (px*width + py*height)/c2
      if u < 0 
        return [@x1, @y1]
      elsif u > 1
        return [@x2, @y2]
      end
      return [@x1 + u*width, @y1 + u*height]
    end
  end
end