require 'minitest/autorun'

require_relative '../lib/hom'
require 'active_support/core_ext/string/output_safety'

describe 'HOM::Encoding' do
  describe 'encode method' do
    it 'renders elements with a tag name' do
      element = HOM::Element.new(:br)

      HOM::Encoding.encode(element).must_equal('<br>')
    end

    it 'renders elements with a symbol attribute' do
      element = HOM::Element.new(:input, :disabled)

      HOM::Encoding.encode(element).must_equal('<input disabled>')
    end

    it 'renders elements with a hash of attributes' do
      element = HOM::Element.new(:input, {:type => :text, :size => 30, :value => nil})

      HOM::Encoding.encode(element).must_equal('<input type="text" size="30" value="">')
    end

    it 'renders elements with an array of mixed attributes' do
      element = HOM::Element.new(:input, [{:type => :text, :size => 30}, :disabled])

      HOM::Encoding.encode(element).must_equal('<input type="text" size="30" disabled>')
    end

    it 'renders elements with empty content' do
      element = HOM::Element.new(:h1, nil, '')

      HOM::Encoding.encode(element).must_equal('<h1></h1>')
    end

    it 'renders elements with string content' do
      element = HOM::Element.new(:h2, nil, 'hello world')

      HOM::Encoding.encode(element).must_equal('<h2>hello world</h2>')
    end

    it 'renders elements with numeric content' do
      element = HOM::Element.new(:h4, nil, 1234567890)

      HOM::Encoding.encode(element).must_equal('<h4>1234567890</h4>')
    end

    it 'renders elements with a single child element' do
      element = HOM::Element.new(:h5, nil, HOM::Element.new(:b, nil, 'how bold'))

      HOM::Encoding.encode(element).must_equal('<h5><b>how bold</b></h5>')
    end

    it 'renders elements with nil content' do
      element = HOM::Element.new(:h6, nil, nil)

      HOM::Encoding.encode(element).must_equal('<h6></h6>')
    end

    it 'renders elements with multiple child elements' do
      element = HOM::Element.new(:ul, nil, (1..3).map { |n| HOM::Element.new(:li, nil, n) })

      HOM::Encoding.encode(element).must_equal('<ul><li>1</li><li>2</li><li>3</li></ul>')
    end

    it 'escapes string content' do
      element = HOM::Element.new(:h3, nil, 'a && b, x > y')

      HOM::Encoding.encode(element).must_equal('<h3>a &amp;&amp; b, x &gt; y</h3>')
    end

    it 'does not escape content that has been marked as html safe' do
      element = HOM::Element.new(:span, nil, '<br>'.html_safe)

      HOM::Encoding.encode(element).must_equal('<span><br></span>')
    end
  end

  describe 'safe_encode method' do
    it 'encodes the argument and marks it as html safe' do
      element = HOM::Element.new(:br)

      output = HOM::Encoding.safe_encode(element)
      output.must_equal('<br>')
      output.html_safe?.must_equal(true)
    end
  end
end
