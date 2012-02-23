require 'cgi'

module HOM
  class AttributeList
    def initialize
      @index = {}
    end

    def html
      @index.map { |name, value| attribute_html(name, value) }.join
    end

    Undefined = Class.new

    def set(name, value = Undefined)
      @index[name.to_s] = value
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

    private

    def attribute_html(name, value)
      value == Undefined ? " #{name}" : %( #{name}="#{escape value}")
    end

    def escape(object)
      CGI.escapeHTML(object.to_s)
    end
  end
end
