require 'minitest/autorun'
require 'active_support/core_ext/string/output_safety'

$:.unshift 'lib'

require 'hom'

class HOM::Element::TestCase < MiniTest::Unit::TestCase
  def setup
    @br = HOM::Element.new(:br)
    @i1 = HOM::Element.new(:input, :disabled)
    @i2 = HOM::Element.new(:input, {type: :text, size: 30})
    @i3 = HOM::Element.new(:input, [{type: :text, size: 30}, :disabled])
    @h1 = HOM::Element.new(:h1, nil, '')
    @h2 = HOM::Element.new(:h2, nil, 'hello world')
    @h3 = HOM::Element.new(:h3, nil, 'a && b, x > y')
    @h4 = HOM::Element.new(:h4, nil, 1234567890)
    @h5 = HOM::Element.new(:h5, nil, HOM::Element.new(:b, nil, 'how bold'))
    @ul = HOM::Element.new(:ul, nil, (1..3).map { |n| HOM::Element.new(:li, nil, n) })
  end

  def test_stringification
    assert_equal '<br>', @br.to_s
    assert_equal '<input disabled>', @i1.to_s
    assert_equal '<input type="text" size="30">', @i2.to_s
    assert_equal '<input type="text" size="30" disabled>', @i3.to_s
    assert_equal '<h1></h1>', @h1.to_s
    assert_equal '<h2>hello world</h2>', @h2.to_s
    assert_equal '<h3>a &amp;&amp; b, x &gt; y</h3>', @h3.to_s
    assert_equal '<h4>1234567890</h4>', @h4.to_s
    assert_equal '<h5><b>how bold</b></h5>', @h5.to_s
    assert_equal '<ul><li>1</li><li>2</li><li>3</li></ul>', @ul.to_s
  end

  def test_output_safety
    assert @br.to_s.html_safe?

    assert '<span><br></span>', HOM::Element.new(:span, nil, '<br>'.html_safe).to_s
  end

  def test_attribute_access
    assert_equal :text, @i3[:type].value
    assert_equal 30, @i3[:size].value
    assert_equal nil, @i3[:disabled].value
  end
end
