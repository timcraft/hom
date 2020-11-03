require 'spec_helper'

RSpec.describe HOM::Encoding do
  describe '#encode' do
    it 'renders elements with a tag name' do
      element = HOM::Element.new(:br)

      expect(HOM::Encoding.encode(element)).to eq('<br>')
    end

    it 'renders elements with a symbol attribute' do
      element = HOM::Element.new(:input, :disabled)

      expect(HOM::Encoding.encode(element)).to eq('<input disabled>')
    end

    it 'renders elements with a hash of attributes' do
      element = HOM::Element.new(:input, {:type => :text, :size => 30, :value => nil})

      expect(HOM::Encoding.encode(element)).to eq('<input type="text" size="30" value="">')
    end

    it 'renders elements with an array of mixed attributes' do
      element = HOM::Element.new(:input, [{:type => :text, :size => 30}, :disabled])

      expect(HOM::Encoding.encode(element)).to eq('<input type="text" size="30" disabled>')
    end

    it 'renders elements with empty content' do
      element = HOM::Element.new(:h1, nil, '')

      expect(HOM::Encoding.encode(element)).to eq('<h1></h1>')
    end

    it 'renders elements with string content' do
      element = HOM::Element.new(:h2, nil, 'hello world')

      expect(HOM::Encoding.encode(element)).to eq('<h2>hello world</h2>')
    end

    it 'renders elements with numeric content' do
      element = HOM::Element.new(:h4, nil, 1234567890)

      expect(HOM::Encoding.encode(element)).to eq('<h4>1234567890</h4>')
    end

    it 'renders elements with a single child element' do
      element = HOM::Element.new(:h5, nil, HOM::Element.new(:b, nil, 'how bold'))

      expect(HOM::Encoding.encode(element)).to eq('<h5><b>how bold</b></h5>')
    end

    it 'renders elements with nil content' do
      element = HOM::Element.new(:h6, nil, nil)

      expect(HOM::Encoding.encode(element)).to eq('<h6></h6>')
    end

    it 'renders elements with multiple child elements' do
      element = HOM::Element.new(:ul, nil, (1..3).map { |n| HOM::Element.new(:li, nil, n) })

      expect(HOM::Encoding.encode(element)).to eq('<ul><li>1</li><li>2</li><li>3</li></ul>')
    end

    it 'escapes string content' do
      element = HOM::Element.new(:h3, nil, 'a && b, x > y')

      expect(HOM::Encoding.encode(element)).to eq('<h3>a &amp;&amp; b, x &gt; y</h3>')
    end

    it 'does not escape content that has been marked as html safe' do
      element = HOM::Element.new(:span, nil, '<br>'.html_safe)

      expect(HOM::Encoding.encode(element)).to eq('<span><br></span>')
    end
  end

  describe '#safe_encode' do
    it 'encodes the argument and marks it as html safe' do
      element = HOM::Element.new(:br)

      output = HOM::Encoding.safe_encode(element)

      expect(output).to eq('<br>')
      expect(output.html_safe?).to eq(true)
    end
  end
end
