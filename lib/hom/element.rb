require 'cgi'

module HOM
  class Element
    def initialize(tag_name, attributes = nil, content = nil)
      @tag_name, @attributes, @content = tag_name, AttributeList.new.update(attributes), content
    end

    def html
      start_tag = "<#{@tag_name}#{@attributes.html}>"

      @content.nil? ? start_tag : "#{start_tag}#{escape(@content)}</#{@tag_name}>"
    end

    def to_s
      html_safe(html)
    end

    def lookup(name)
      @attributes.lookup(name)
    end

    alias :[] :lookup

    private

    def html_safe(string)
      string.respond_to?(:html_safe) ? string.html_safe : string
    end

    def escape(object)
      if object.is_a?(Array)
        object.map { |item| escape(item) }.join
      elsif object.respond_to?(:html)
        object.html
      elsif object.respond_to?(:html_safe?) && object.html_safe?
        object.to_s
      else
        CGI.escapeHTML(object.to_s)
      end
    end
  end
end
