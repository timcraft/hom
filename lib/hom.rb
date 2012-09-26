require 'cgi'

module HOM
  Undefined = Class.new

  class Entity
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def html
      numeric? ? "&\##{value};" : "&#{value};"
    end

    def numeric?
      Numeric === @value
    end

    def named?
      !numeric?
    end
  end

  class Element
    def initialize(tag_name, attributes = nil, content = Undefined)
      @tag_name, @attributes, @content = tag_name, AttributeList.new.update(attributes), content
    end

    def html
      @content == Undefined ? start_tag : "#{start_tag}#{encode(@content)}</#{@tag_name}>"
    end

    def to_s
      html_safe(html)
    end

    private

    def html_safe(string)
      string.respond_to?(:html_safe) ? string.html_safe : string
    end

    def encode(object)
      if object.is_a?(Array)
        object.map { |item| encode(item) }.join
      elsif object.respond_to?(:html)
        object.html
      elsif object.respond_to?(:html_safe?) && object.html_safe?
        object.to_s
      else
        HOM.escape(object)
      end
    end

    def start_tag
      "<#{@tag_name}#{@attributes.html}>"
    end
  end

  class AttributeList
    def initialize
      @index = {}
    end

    def html
      @index.map { |name, value| attribute_html(name, value) }.join
    end

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
      value == Undefined ? " #{name}" : %( #{name}="#{HOM.escape value}")
    end
  end

  def self.escape(object)
    CGI.escapeHTML(object.to_s)
  end
end
