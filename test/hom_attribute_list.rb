require 'minitest/autorun'

$:.unshift 'lib'

require 'hom'

class HOM::AttributeList::TestCase < MiniTest::Unit::TestCase
  def setup
    @list = HOM::AttributeList.new
  end

  def test_update_with_nil
    @list.update(nil)

    assert_empty @list.html
  end

  def test_update_with_symbol
    @list.update(:disabled)

    assert_equal ' disabled', @list.html
  end

  def test_update_with_hash
    @list.update({type: :text, size: 30, value: nil})

    assert_equal ' type="text" size="30" value=""', @list.html
  end

  def test_update_with_array
    @list.update([{type: :text}, :disabled])

    assert_equal ' type="text" disabled', @list.html
  end

  def test_update_with_duplicate_symbols
    @list.update([:disabled, :disabled])

    assert_equal ' disabled', @list.html
  end
end
