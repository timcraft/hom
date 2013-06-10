require 'cgi'

module HOM
  Undefined = Class.new

  class Entity
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def to_s
      numeric? ? "&\##{value};" : "&#{value};"
    end

    def numeric?
      Numeric === @value
    end

    def named?
      !numeric?
    end

    def html_safe?
      true
    end
  end

  class Element
    attr_reader :tag_name, :attributes, :content

    def initialize(tag_name, attributes = nil, content = Undefined)
      @tag_name, @attributes, @content = tag_name, AttributeList.new.update(attributes), content
    end

    def content?
      @content != Undefined
    end

    def html_safe?
      true
    end

    def to_s
      Encoding.safe_encode(self)
    end
  end

  class NodeList
    def initialize(nodes)
      @nodes = Array(nodes)
    end

    def html_safe?
      true
    end

    def to_s
      Encoding.safe_encode(self)
    end

    def to_a
      @nodes
    end

    def +(object)
      self.class.new(@nodes + Array(object))
    end

    def join(separator)
      self.class.new(intersperse(separator, @nodes))
    end

    private

    def intersperse(separator, array)
      array.inject([]) do |tmp, item|
        tmp << separator unless tmp.empty?
        tmp << item
        tmp
      end
    end
  end

  class AttributeList
    def initialize
      @index = {}
    end

    def set(name, value = Undefined)
      @index[name.to_s] = value
    end

    def to_hash
      @index
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

  module Encoding
    def self.safe_encode(object)
      safe(encode(object))
    end

    def self.encode(object)
      if object.is_a?(Array)
        object.map { |item| encode(item) }.join
      elsif object.is_a?(NodeList)
        object.to_a.map { |item| encode(item) }.join
      elsif object.is_a?(Element)
        encode_element(object)
      elsif object.respond_to?(:html_safe?) && object.html_safe?
        object.to_s
      else
        escape(object)
      end
    end

    def self.encode_element(object)
      object.content? ? "#{start_tag(object)}#{encode(object.content)}</#{object.tag_name}>" : start_tag(object)
    end

    def self.start_tag(element)
      "<#{element.tag_name}#{encode_attributes(element)}>"
    end

    def self.encode_attributes(element)
      element.attributes.to_hash.map { |name, value| encode_attribute(name, value) }.join
    end

    def self.encode_attribute(name, value)
      value == Undefined ? " #{name}" : %( #{name}="#{escape value}")
    end

    def self.safe(string)
      string.respond_to?(:html_safe) ? string.html_safe : string
    end

    def self.escape(object)
      CGI.escapeHTML(object.to_s)
    end
  end
end
