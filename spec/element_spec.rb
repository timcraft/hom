require 'minitest/autorun'
require 'active_support/core_ext/string/output_safety'

require_relative '../lib/hom'

describe 'Element' do
  before do
    @br = HOM::Element.new(:br)
    @i1 = HOM::Element.new(:input, :disabled)
    @i2 = HOM::Element.new(:input, {type: :text, size: 30, value: nil})
    @i3 = HOM::Element.new(:input, [{type: :text, size: 30}, :disabled])
    @h1 = HOM::Element.new(:h1, nil, '')
    @h2 = HOM::Element.new(:h2, nil, 'hello world')
    @h3 = HOM::Element.new(:h3, nil, 'a && b, x > y')
    @h4 = HOM::Element.new(:h4, nil, 1234567890)
    @h5 = HOM::Element.new(:h5, nil, HOM::Element.new(:b, nil, 'how bold'))
    @h6 = HOM::Element.new(:h6, nil, nil)
    @ul = HOM::Element.new(:ul, nil, (1..3).map { |n| HOM::Element.new(:li, nil, n) })
  end

  describe 'content query method' do
    it 'should return false if the content is undefined' do
      @br.content?.must_equal(false)
    end

    it 'should return true otherwise' do
      @h1.content?.must_equal(true)
    end
  end

  describe 'to_s method' do
    it 'should return a string containing the correct markup' do
      @br.to_s.must_equal('<br>')
      @i1.to_s.must_equal('<input disabled>')
      @i2.to_s.must_equal('<input type="text" size="30" value="">')
      @i3.to_s.must_equal('<input type="text" size="30" disabled>')
      @h1.to_s.must_equal('<h1></h1>')
      @h2.to_s.must_equal('<h2>hello world</h2>')
      @h3.to_s.must_equal('<h3>a &amp;&amp; b, x &gt; y</h3>')
      @h4.to_s.must_equal('<h4>1234567890</h4>')
      @h5.to_s.must_equal('<h5><b>how bold</b></h5>')
      @h6.to_s.must_equal('<h6></h6>')
      @ul.to_s.must_equal('<ul><li>1</li><li>2</li><li>3</li></ul>')
    end

    it 'should not encode content that has been marked as html safe' do
      HOM::Element.new(:span, nil, '<br>').to_s.must_equal('<span>&lt;br&gt;</span>')
      HOM::Element.new(:span, nil, '<br>'.html_safe).to_s.must_equal('<span><br></span>')
    end

    it 'should return content that is marked as html safe' do
      @br.to_s.html_safe?.must_equal(true)
    end
  end
end
