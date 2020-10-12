require 'minitest/autorun'
require 'minitest/global_expectations'

require_relative '../lib/hom'

describe 'HOM::Entity' do
  before do
    @named_entity = HOM::Entity.new(:nbsp)

    @numeric_entity = HOM::Entity.new(160)
  end

  describe 'value method' do
    it 'returns the value passed to the constructor' do
      @named_entity.value.must_equal(:nbsp)

      @numeric_entity.value.must_equal(160)
    end
  end

  describe 'numeric query method' do
    it 'returns false for named entities' do
      @named_entity.numeric?.must_equal(false)
    end

    it 'returns true for numeric entities' do
      @numeric_entity.numeric?.must_equal(true)
    end
  end

  describe 'named query method' do
    it 'returns true for named entities' do
      @named_entity.named?.must_equal(true)
    end

    it 'returns false for numeric entities' do
      @numeric_entity.named?.must_equal(false)
    end
  end

  describe 'to_s method' do
    it 'returns the encoded html entity' do
      @named_entity.to_s.must_equal('&nbsp;')

      @numeric_entity.to_s.must_equal('&#160;')
    end
  end

  describe 'html_safe query method' do
    it 'returns true' do
      @named_entity.html_safe?.must_equal(true)

      @numeric_entity.html_safe?.must_equal(true)
    end
  end

  describe 'addition of an entity with another object' do
    it 'returns a node list containing the two nodes' do
      nodes = HOM::Entity.new(:pound) + '9.99'
      nodes.must_be_instance_of(HOM::NodeList)
      nodes.to_s.must_equal('&pound;9.99')
    end
  end
end
