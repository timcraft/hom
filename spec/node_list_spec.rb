require 'minitest/autorun'
require 'active_support/core_ext/string/output_safety'
require 'hom'

describe 'HOM::NodeList' do
  describe 'html_safe query method' do
    it 'returns true' do
      HOM::NodeList.new([]).html_safe?.must_equal(true)
    end
  end

  describe 'to_s method' do
    it 'returns an html safe string containing the encoded nodes' do
      nodes = HOM::NodeList.new(['Hello', HOM::Entity.new(:nbsp), HOM::Element.new(:b, nil, 'World')])

      output = nodes.to_s
      output.must_equal('Hello&nbsp;<b>World</b>')
      output.html_safe?.must_equal(true)
    end
  end

  describe 'to_a method' do
    it 'returns the array of nodes passed to the constructor' do
      nodes = HOM::NodeList.new(%w(a b c))
      nodes.to_a.must_equal(%w(a b c))
    end
  end

  describe 'addition of two node lists' do
    it 'returns a new node list containing the items in each list' do
      nodes = HOM::NodeList.new(['one']) + HOM::NodeList.new(['two'])
      nodes.must_be_instance_of(HOM::NodeList)
      nodes.to_a.must_equal(%w(one two))
    end
  end

  describe 'addition of a node list with an element object' do
    it 'returns a new node list containing the items in the list and the additional element' do
      element = HOM::Element.new(:b, nil, 'World')

      nodes = HOM::NodeList.new(['Hello', HOM::Entity.new(:nbsp)]) + element
      nodes.must_be_instance_of(HOM::NodeList)
      nodes.to_s.must_equal('Hello&nbsp;<b>World</b>')
    end
  end

  describe 'join method' do
    it 'returns an html safe string containing the encoded nodes seperated by the argument' do
      output = HOM::NodeList.new(%w(a b c)).join(HOM::Entity.new(:nbsp))
      output.html_safe?.must_equal(true)
      output.must_equal('a&nbsp;b&nbsp;c')
    end
  end
end
