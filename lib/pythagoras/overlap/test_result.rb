module Pythagoras
  module Overlap
    
    TestResult = Struct.new(:overlap, :point) do 

      def self.failed
        TestResult.new(false, nil)
      end

      def self.passed results=nil
        TestResult.new(true, results)
      end
    end

  end
end