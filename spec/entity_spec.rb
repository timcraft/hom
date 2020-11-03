require 'spec_helper'

RSpec.describe HOM::Entity do
  let(:named_entity) { HOM::Entity.new(:nbsp) }
  let(:numeric_entity) { HOM::Entity.new(160) }

  describe '#value' do
    it 'returns the value passed to the constructor' do
      expect(named_entity.value).to eq(:nbsp)

      expect(numeric_entity.value).to eq(160)
    end
  end

  describe '#numeric?' do
    it 'returns false for named entities' do
      expect(named_entity.numeric?).to eq(false)
    end

    it 'returns true for numeric entities' do
      expect(numeric_entity.numeric?).to eq(true)
    end
  end

  describe '#named?' do
    it 'returns true for named entities' do
      expect(named_entity.named?).to eq(true)
    end

    it 'returns false for numeric entities' do
      expect(numeric_entity.named?).to eq(false)
    end
  end

  describe '#to_s' do
    it 'returns the encoded html entity' do
      expect(named_entity.to_s).to eq('&nbsp;')

      expect(numeric_entity.to_s).to eq('&#160;')
    end
  end

  describe '#html_safe?' do
    it 'returns true' do
      expect(named_entity.html_safe?).to eq(true)

      expect(numeric_entity.html_safe?).to eq(true)
    end
  end

  describe '#+' do
    it 'returns a node list containing the two nodes' do
      nodes = HOM::Entity.new(:pound) + '9.99'

      expect(nodes).to be_instance_of(HOM::NodeList)
      expect(nodes.to_s).to eq('&pound;9.99')
    end
  end
end
