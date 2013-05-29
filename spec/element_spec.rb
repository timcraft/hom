require 'minitest/autorun'
require 'active_support/core_ext/string/output_safety'
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

  describe 'html_safe query method' do
    it 'returns true' do
      HOM::Element.new(:br).html_safe?.must_equal(true)
    end
  end

  describe 'to_s method' do
    it 'returns an html safe string containing the encoded element' do
      output = HOM::Element.new(:br).to_s
      output.html_safe?.must_equal(true)
      output.must_equal('<br>')
    end
  end
end
