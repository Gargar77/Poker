class Hand
    attr_reader :set, :deck
    def initialize(deck)
        @deck = deck
        @set = get_set
    end

    def get_set

    end
end