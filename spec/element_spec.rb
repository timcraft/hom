require 'spec_helper'

RSpec.describe HOM::Element do
  describe '#content?' do
    it 'returns false if the content is undefined' do
      expect(HOM::Element.new(:br).content?).to eq(false)
    end

    it 'returns true otherwise' do
      expect(HOM::Element.new(:h1, nil, '').content?).to eq(true)
    end
  end

  describe '#html_safe?' do
    it 'returns true' do
      expect(HOM::Element.new(:br).html_safe?).to eq(true)
    end
  end

  describe '#to_s' do
    it 'returns an html safe string containing the encoded element' do
      output = HOM::Element.new(:br).to_s
      expect(output.html_safe?).to eq(true)
      expect(output).to eq('<br>')
    end
  end

  describe '#+' do
    it 'returns a node list containing the two nodes' do
      nodes = HOM::Element.new(:br) + "\n"
      expect(nodes).to be_instance_of(HOM::NodeList)
      expect(nodes.to_s).to eq("<br>\n")
    end
  end
end
