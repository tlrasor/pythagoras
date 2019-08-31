module Pythagoras
  module Overlap
    module LineSegmentTests
      # see: https://2dengine.com/?p=intersections#Segment_vs_segment
      def self.segment_segment segment1, segment2
        dx1 = segment1.width
        dy1 = segment1.height

        dx2 = segment2.width
        dy2 = segment2.height

        dx3 = segment1.x1 - segment2.x1
        dy3 = segment1.y1 - segment2.y1

        det = dx1*dy2 - dy1*dx2
        if det == 0
          return TestResult.failed
        end

        t1 = (dx2*dy3 - dy2*dx3)/det
        if t1 < 0 || t1 > 1
          return TestResult.failed
        end
        t2 = (dx1*dy3 - dy1*dx3)/det
        if t2 < 0 || t2 > 1 
          return TestResult.failed
        end
        return TestResult.passed [x1 + t1*dx1, y1 + t1*dy1]
      end

      def self.segment_aa_rect segment, aa_rect
        if segment.degenerate?
          return TestResult.failed
        end
        norm = segment.to_vect2.normalize
        tmin = 0
        tmax = segment.length
        if norm.x == 0
          if segment.x1 < aa_rect.l || segment.x1 > aa_rect.r
            return TestResult.failed
          end
        else
          tl = (aa_rect.l - segment.x1)/norm.x
          tr = (aa_rect.r - segment.x1)/norm.x
          if tl > tr
            tl = tr
            tr = tl
          end
          tmin = [tmin, tl].max
          tmax = [tmax, tr].min
          if tmin > tmax
            return TestResult.failed
          end
        end
        if norm.y == 0
          if segment.y1 < aa_rect.t || segment.y1 > aa_rect.b
            return TestResult.failed
          end
        else
          tt = (aa_rect.t - segment.y1)/norm.y
          tb = (aa_rect.b - segment.y1)/norm.y
          if tt > tb
            tt = tb
            tb = tt
          end
          tmin = [tmin, tt].max
          tmax = [tmax, tb].min
          if tmin > tmax
            return TestResult.failed
          end
        end
        q1x = segment.x1 + (norm.x * tmin)
        q1y = segment.y1 + (norm.y * tmin)
        if tmin == tmax
          return TestResult.passed([[q1x, q1y]])
        end
        q2x = segment.x1 + (norm.x * tmax)
        q2y = segment.y1 + (norm.y * tmax)
        return TestResult.passed([[q1x, q1y], [q2x, q2y]])
      end
    end
  end
end