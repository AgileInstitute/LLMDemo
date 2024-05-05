class MySet
    def initialize(elements = [])
        @elements = elements.uniq
    end

    def isEmpty
        @elements.empty?
    end

    def has(element)
        @elements.include?(element)
    end

    def intersect_with(other_set)
        intersection = @elements & other_set.elements
        MySet.new(intersection)
    end

    def union(other_set)
        united = @elements | other_set.elements
        MySet.new(united)
    end

    def is_superset_of(other_set)
        (other_set.elements - @elements).empty?
    end

    protected

    def elements
        @elements
    end
end