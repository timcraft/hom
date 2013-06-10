require 'minitest/autorun'
require 'hom'

describe 'HOM::Entity initialized with a symbol' do
  before do
    @entity = HOM::Entity.new(:nbsp)
  end

  describe 'value method' do
    it 'returns the symbol value' do
      @entity.value.must_equal(:nbsp)
    end
  end

  describe 'numeric query method' do
    it 'returns false' do
      @entity.numeric?.must_equal(false)
    end
  end

  describe 'named query method' do
    it 'returns true' do
      @entity.named?.must_equal(true)
    end
  end

  describe 'to_s method' do
    it 'returns the encoded html entity' do
      @entity.to_s.must_equal('&nbsp;')
    end
  end

  describe 'html_safe query method' do
    it 'returns true' do
      @entity.html_safe?.must_equal(true)
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

describe 'HOM::Entity initialized with an integer' do
  before do
    @entity = HOM::Entity.new(160)
  end

  describe 'value method' do
    it 'returns the integer value' do
      @entity.value.must_equal(160)
    end
  end

  describe 'numeric query method' do
    it 'returns true' do
      @entity.numeric?.must_equal(true)
    end
  end

  describe 'named query method' do
    it 'returns false' do
      @entity.named?.must_equal(false)
    end
  end

  describe 'to_s method' do
    it 'returns the encoded html entity' do
      @entity.to_s.must_equal('&#160;')
    end
  end

  describe 'html_safe query method' do
    it 'returns true' do
      @entity.html_safe?.must_equal(true)
    end
  end
end
