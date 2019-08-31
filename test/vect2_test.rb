require "test_helper"

class AnglesTest < Minitest::Test
  def test_components
    v = Pythagoras::Vect2.new(0,1)
    assert_equal 0, v.x
    assert_equal 1, v.y
  end

  def test_add
    v1 = Pythagoras::Vect2.new(0,1)
    v2 = Pythagoras::Vect2.new(1,1)
    v3 = Pythagoras::Vect2.new(1,2)
    assert_equal v3, v1+v2
  end

  def test_subtract
    v1 = Pythagoras::Vect2.new(1,2)
    v2 = Pythagoras::Vect2.new(1,1)
    v3 = Pythagoras::Vect2.new(0,1)
    assert_equal v3, v1-v2
  end

  def test_scale
    v1 = Pythagoras::Vect2.new(1,2)
    v2 = Pythagoras::Vect2.new(4,8)
    assert_equal v2, v1.scale(4)

    v1 = Pythagoras::Vect2.new(-1,2)
    v2 = Pythagoras::Vect2.new(4,-8)
    assert_equal v2, v1 * -4
  end

  def test_magnitude
    v1 = Pythagoras::Vect2.new(4,8)
    mag = Math.hypot(4,8)
    assert_equal mag, v1.magnitude
  end

  def test_dot
    v1 = Pythagoras::Vect2.new(4,8)
    v2 = Pythagoras::Vect2.new(22,-11)
    assert_equal 0, v1.dot(v2)
    assert_equal 0, v2.dot(v1)

    v1 = Pythagoras::Vect2.new(4,8)
    v2 = Pythagoras::Vect2.new(-2, 3.156)
    assert_equal 17.248, v1.dot(v2).truncate(4)
    assert_equal 17.248, v2.dot(v1).truncate(4)
  end

  def test_perp
    v1 = Pythagoras::Vect2.new(4,8)
    perp = Pythagoras::Vect2.new(-8,4)
    assert_equal perp, v1.perp
  end

  def test_perpdot
    v1 = Pythagoras::Vect2.new(4,8)
    v2 = Pythagoras::Vect2.new(22,-11)
    assert_equal -220, v1.perpdot(v2)

    v1 = Pythagoras::Vect2.new(4,8)
    v2 = Pythagoras::Vect2.new(-2, 3.156)
    assert_equal 28.624, v1.cross(v2).truncate(4)
  end

  def test_angle_between
    v1 = Pythagoras::Vect2.new(4,8)
    assert_equal Math::PI/2, v1.angle_between(v1.perp)

    v1 = Pythagoras::Vect2.new(4,8)
    v2 = Pythagoras::Vect2.new(22,-11)
    assert_equal -Math::PI/2, v1.angle_between(v2)

    v1 = Pythagoras::Vect2.new(4,8)
    v2 = Pythagoras::Vect2.new(-2, 3.156)
    assert_equal 1.0284, v1.angle_between(v2).truncate(4)
  end

  def test_normalize
    v1 = Pythagoras::Vect2.new(10, -10)
    v2 = Pythagoras::Vect2.new(0.7071067811865475,-0.7071067811865475)
    assert_equal v2, v1.normalize

    v1 = Pythagoras::Vect2.new(4,8)
    v2 = Pythagoras::Vect2.new(0.4472135954999579,0.8944271909999159)
    assert_equal v2, v1.normalize

    v1 = Pythagoras::Vect2.zero
    v2 = Pythagoras::Vect2.zero
    assert_equal v2, v1.normalize
  end

  def test_zero_out
    zero = Pythagoras::Vect2.new(0.0001,0.01).zero_out
    assert_equal 0.000, zero.x
    assert_equal 0.010, zero.y
  end

  def test_zero
    zero = Pythagoras::Vect2.new(0,0)
    assert_equal zero, Pythagoras::Vect2.zero
  end

  def test_from
    v1 = Pythagoras::Vect2.from(0, 1)
    assert_equal Math.sin(0), v1.y
    assert_equal Math.cos(0), v1.x

    v1 = Pythagoras::Vect2.from(Math::PI, 1)
    assert_equal Math.sin(Math::PI), v1.y
    assert_equal Math.cos(Math::PI), v1.x
  end
end