require 'minitest/autorun'
require 'mocha/setup'
require 'hom'

describe 'HOM::Element' do
  describe 'content query method' do
    it 'returns false if the content is undefined' do
      HOM::Element.new(:br).content?.must_equal(false)
    end

    it 'returns true otherwise' do
      HOM::Element.new(:h1, nil, '').content?.must_equal(true)
    end
  end

  describe 'to_s method' do
    it 'safely encodes itself using the encoding module' do
      element = HOM::Element.new(:br)

      HOM::Encoding.expects(:safe_encode).with(element)

      element.to_s
    end
  end
end
