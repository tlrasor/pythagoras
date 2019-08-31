require "test_helper"

class FloatsTest < Minitest::Test
  def test_zero_out
    assert_equal 1.0, Pythagoras::Floats.zero_out(1.0)
    assert_equal 0.1, Pythagoras::Floats.zero_out(0.1)
    assert_equal 0.0010, Pythagoras::Floats.zero_out(0.0010)
    assert_equal 0.0000, Pythagoras::Floats.zero_out(0.0001)
    assert_equal 0.0000, Pythagoras::Floats.zero_out(0.00001)
  end

  def test_zero_out_with_limit
    assert_equal 1.0, Pythagoras::Floats.zero_out(1.0, 0.1)
    assert_equal 0.1, Pythagoras::Floats.zero_out(0.1, 0.1)
    assert_equal 0.0000, Pythagoras::Floats.zero_out(0.0010, 0.1)
    assert_equal 0.0000, Pythagoras::Floats.zero_out(0.0001, 0.1)
  end

end
