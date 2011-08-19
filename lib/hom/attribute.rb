require 'cgi'

module HOM
  class Attribute < Struct.new(:name, :value)
    def html
      value.nil? ? " #{name}" : %( #{name}="#{CGI.escapeHTML(value.to_s)}")
    end
  end
end
