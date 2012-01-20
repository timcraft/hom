module HOM
  class AttributeList
    def initialize
      @index = {}
    end

    def length
      @index.size
    end

    def html
      @index.values.map(&:html).join
    end

    def lookup(name)
      @index[name.to_s]
    end

    alias :[] :lookup

    def set(name, value = nil)
      attribute = lookup(name)

      if attribute.nil?
        @index[name.to_s] = Attribute.new(name, value)
      else
        attribute.value = value
      end
    end

    def update(object)
      case object
      when NilClass
        :pass
      when Hash
        object.each { |k, v| set(k, v) }
      when Array
        object.each { |item| update(item) }
      else
        set(object)
      end

      return self
    end
  end
end
