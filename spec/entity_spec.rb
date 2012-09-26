require 'minitest/autorun'

require_relative '../lib/hom'

describe 'Named entity' do
  before do
    @entity = HOM::Entity.new(:nbsp)
  end

  describe 'value method' do
    it 'should return the symbol value' do
      @entity.value.must_equal(:nbsp)
    end
  end

  describe 'numeric query method' do
    it 'should return false' do
      @entity.numeric?.must_equal(false)
    end
  end

  describe 'named query method' do
    it 'should return true' do
      @entity.named?.must_equal(true)
    end
  end

  describe 'to_s method' do
    it 'should return the encoded html entity' do
      @entity.to_s.must_equal('&nbsp;')
    end
  end

  describe 'html_safe query method' do
    it 'should return true' do
      @entity.html_safe?.must_equal(true)
    end
  end
end

describe 'Numeric entity' do
  before do
    @entity = HOM::Entity.new(160)
  end

  describe 'value method' do
    it 'should return the integer value' do
      @entity.value.must_equal(160)
    end
  end

  describe 'numeric query method' do
    it 'should return true' do
      @entity.numeric?.must_equal(true)
    end
  end

  describe 'named query method' do
    it 'should return false' do
      @entity.named?.must_equal(false)
    end
  end

  describe 'to_s method' do
    it 'should return the encoded html entity' do
      @entity.to_s.must_equal('&#160;')
    end
  end

  describe 'html_safe query method' do
    it 'should return true' do
      @entity.html_safe?.must_equal(true)
    end
  end
end
