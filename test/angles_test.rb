require "test_helper"

class AnglesTest < Minitest::Test
  def test_to_rad
    assert_equal 0.0000, Pythagoras::Angles.to_rad(0)
    assert_equal 1.5707, Pythagoras::Angles.to_rad(90).truncate(4)
    assert_equal 3.1415, Pythagoras::Angles.to_rad(180).truncate(4)
    assert_equal 6.2831, Pythagoras::Angles.to_rad(360).truncate(4)
    assert_equal 1.9373, Pythagoras::Angles.to_rad(111).truncate(4)
  end

  def test_to_degrees
    assert_equal 0.0, Pythagoras::Angles.to_degrees(0.0).truncate
    assert_equal 90, Pythagoras::Angles.to_degrees(1.5708).truncate
    assert_equal 180, Pythagoras::Angles.to_degrees(3.1416).truncate
    assert_equal 360, Pythagoras::Angles.to_degrees(6.2832).truncate
    assert_equal 111, Pythagoras::Angles.to_degrees(1.9374).truncate
  end

end
