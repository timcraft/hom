module HOM
  class AttributeList < Array
    def html
      map(&:html).join
    end

    def lookup(name)
      detect { |object| object.name.to_s == name.to_s }
    end

    def set(name, value = nil)
      attribute = lookup(name)

      if attribute.nil?
        self << Attribute.new(name, value)
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
