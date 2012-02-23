require 'minitest/autorun'

require_relative '../lib/hom'

class HOM::Entity::TestCase < MiniTest::Unit::TestCase
  def setup
    @e160 = HOM::Entity.new(160)

    @nbsp = HOM::Entity.new(:nbsp)
  end

  def test_value_method
    assert_equal 160, @e160.value
    assert_equal :nbsp, @nbsp.value
  end

  def test_numeric_query_method
    assert_equal true, @e160.numeric?
    assert_equal false, @nbsp.numeric?
  end

  def test_named_query_method
    assert_equal false, @e160.named?
    assert_equal true, @nbsp.named?
  end

  def test_html_method
    assert_equal '&#160;', @e160.html
    assert_equal '&nbsp;', @nbsp.html
  end
end
