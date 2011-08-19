require 'minitest/autorun'

$:.unshift 'lib'

require 'hom'

class HOM::AttributeList::TestCase < MiniTest::Unit::TestCase
  def setup
    @list = HOM::AttributeList.new
  end

  def test_update_with_nil
    @list.update(nil)

    assert_equal 0, @list.length
  end

  def test_update_with_symbol
    @list.update(:disabled)

    assert_equal 1, @list.length
    assert_equal :disabled, @list[0].name
    assert_equal nil, @list[0].value
  end

  def test_update_with_hash
    @list.update({type: :text, size: 30})

    assert_equal 2, @list.length
    assert_equal :type, @list[0].name
    assert_equal :text, @list[0].value
    assert_equal :size, @list[1].name
    assert_equal 30, @list[1].value
  end

  def test_update_with_array
    @list.update([{type: :text}, :disabled])

    assert_equal 2, @list.length
    assert_equal :type, @list[0].name
    assert_equal :text, @list[0].value
    assert_equal :disabled, @list[1].name
    assert_equal nil, @list[1].value
  end

  def test_update_with_duplicate_symbols
    @list.update([:disabled, :disabled])

    assert_equal 1, @list.length
    assert_equal :disabled, @list[0].name
    assert_equal nil, @list[0].value
  end
end
