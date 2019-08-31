module Pythagoras
  module Shapes

    # Defines an axis-aligned rectangle. Special case that is useful for game physics n stuff. 
    # Use SegmentedRectangle for more general rectangle stuff
    class AxisAlignedRectangle

      attr_reader :l, :t, :r, :b

      def initialize l:0, t:0, r:, b:
        @l = l
        @t = t
        @r = r
        @b = b
      end

      def self.from v_min:, v_max:
        AxisAlignedRectangle.new(l: v_min.x, t: v_min.y, r: v_max.x, b: v_max.y)
      end

      def height
        @height ||= (@b - @t)
      end

      def width
        @width ||= (@r - @l)
      end

      def area
        @area ||= (height * width)
      end

      def center
        @center ||= [width/2, height/2]
      end

      def contains? x, y
        if x < @l || x > @r
          return false
        elsif y < @t || y > @b
          return false
        else
          return true
        end 
      end
      
      # Returns the nearest point on the line segment to point (x,y)
      def nearest_point? x, y
        qx = x - @l
        qy = y - @t
        if qx > @r
          qx = @r
        elsif qx < -@r
          qx = -@r
        end
        if qy > @b
          qy = @b
        elsif qy < -@b
          qy = -@b
        end
        
        [qx + x, qy + y] 
      end

    end

  end
end