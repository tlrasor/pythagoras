module Pythagoras
  module Overlap

    module AxisAlignedRectangleTests
      def self.aa_rect_aa_rect rect1, rect2
        if (rect1.l - rect2.l).abs > (rect1.r + rect2.r)
          return TestResult.failed
        end
        if (rect1.t - rect2.t).abs > (rect1.b + rect2.b)
          return TestResult.failed
        end
        TestResult.passed
      end
    end
    
  end
end