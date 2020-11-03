require 'spec_helper'

RSpec.describe HOM::NodeList do
  describe '#html_safe?' do
    it 'returns true' do
      expect(HOM::NodeList.new([]).html_safe?).to eq(true)
    end
  end

  describe '#to_s' do
    it 'returns an html safe string containing the encoded nodes' do
      nodes = HOM::NodeList.new(['Hello', HOM::Entity.new(:nbsp), HOM::Element.new(:b, nil, 'World')])

      output = nodes.to_s

      expect(output).to eq('Hello&nbsp;<b>World</b>')
      expect(output.html_safe?).to eq(true)
    end
  end

  describe '#to_a' do
    it 'returns the array of nodes passed to the constructor' do
      nodes = HOM::NodeList.new(%w(a b c))

      expect(nodes.to_a).to eq(%w(a b c))
    end
  end

  describe '#+' do
    context 'with another node list object' do
      it 'returns a new node list containing the items in each list' do
        nodes = HOM::NodeList.new(['one']) + HOM::NodeList.new(['two'])

        expect(nodes).to be_instance_of(HOM::NodeList)
        expect(nodes.to_a).to eq(%w(one two))
      end
    end

    context 'with an element object' do
      it 'returns a new node list containing the items in the list and the additional element' do
        element = HOM::Element.new(:b, nil, 'World')

        nodes = HOM::NodeList.new(['Hello', HOM::Entity.new(:nbsp)]) + element

        expect(nodes).to be_instance_of(HOM::NodeList)
        expect(nodes.to_s).to eq('Hello&nbsp;<b>World</b>')
      end
    end
  end

  describe '#join' do
    it 'returns a new node list containing the items in the list seperated by the given node' do
      nodes = HOM::NodeList.new(%w(a b c)).join(HOM::Entity.new(:nbsp))

      expect(nodes).to be_instance_of(HOM::NodeList)
      expect(nodes.to_s).to eq('a&nbsp;b&nbsp;c')
    end
  end
end
