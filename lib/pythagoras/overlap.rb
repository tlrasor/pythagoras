require 'pythagoras/overlap/test_result'
require 'pythagoras/overlap/line_segment'
require 'pythagoras/overlap/aa_rect'

module Pythagoras

  module Overlap

    def self.test obj1, obj2
      if Overlap.tests[obj1.class].nil? 
        raise ArgumentError, "Unable to determine overlaps for object type #{obj1.class}" 
      end
      check = Overlap.tests[obj1.class][obj2.class]
      if check.nil? 
        raise ArgumentError, "Unable to determine overlaps between object types #{obj1.class} and #{obj2.class}" 
      end
      result = check.call(obj1, obj2)
      if result.overlap && block_given?
        Proc.new.call result
      end
      return result.overlap
    end

    protected

    def self.tests
      @@tests ||= {
        Pythagoras::AxisAlignedRectangle => {
          Pythagoras::AxisAlignedRectangle => proc{|a,b| AxisAlignedRectangleTests.aa_rect_aa_rect(a,b)},
          Pythagoras::LineSegment => proc {|r,s| LineSegmentTests.segment_aa_rect(s,r)}
        },
        Pythagoras::LineSegment => {
          Pythagoras::LineSegment => proc{|a,b| LineSegmentTests.segment_segment(a,b)},
          Pythagoras::AxisAlignedRectangle => proc {|s,r| LineSegmentTests.segment_aa_rect(s,r)}
        }
      }
    end
    
  end
end