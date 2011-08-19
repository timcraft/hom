module HOM
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
end
