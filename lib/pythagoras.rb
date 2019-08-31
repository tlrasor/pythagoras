require "pythagoras/version"

module Pythagoras
  class Error < StandardError; end
  # Your code goes here...
end

require 'pythagoras/floats'
require 'pythagoras/vect2'
require 'pythagoras/angles'

require 'pythagoras/line_segment'
require 'pythagoras/aa_rectangle'

require 'pythagoras/overlap'

include Pythagoras
