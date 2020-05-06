require_relative 'Deck'
require 'byebug'
class Hand
    FACES = %W[Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace].freeze
    SUITS = %w[ Clubs Diamonds Hearts Spades ].freeze
    attr_reader :set, :deck
    def initialize(deck)
        @deck = deck
        @set = nil
        get_set
    
    end

    def get_set
       current_set = []
       i = 0
       while i < 5
        current_set << deck.cards.pop
       i += 1
       end 
       @set = current_set
    end

    def replenish_set
        set_count = set.length
        add_amount = 5 - set_count

        add_amount.times do 
            @set << deck.cards.pop
        end
    end

    def one_pair? 
        return count_pairs == 1 ? true : false
    end

    def two_pair?
        return count_pairs == 2 ? true : false
    end

    def three_of_a_kind?
        count_kind(3) && !count_kind(2)
    end

    def straight?
        sequential? && suit_count(2)
    end

    def flush?
        suit_count(5) && !sequential?
    end

    def straight_flush?
        suit_count(5) && sequential?
    end

    def four_of_a_kind?
        count_kind(4)
    end

    def full_house?
        faces = set.map { |card| card.face}
        face_pair_count = FACES.map {|face| faces.count(face)}
       return true if face_pair_count.include?(2) && face_pair_count.include?(3)
       false
    end

    def royal_flush?
        faces = set.map {|card| card.face}

        faces.include?("Ace") &&
        faces.include?("King") &&
        faces.include?("Queen") &&
        faces.include?("Jack") &&
        faces.include?("Ten") &&
        suit_count(5)
    end

    def high_card
       ranks = set.map { |card| card.rank}.sort
       return ranks[-1]
    end

    def hand_rank
        return 23 if royal_flush?
        return 22 if straight_flush?
        return 21 if four_of_a_kind?
        return 20 if full_house?
        return 19 if flush?
        return 18 if straight?
        return 17 if three_of_a_kind?
        return 16 if two_pair?
        return 15 if one_pair?
        return high_card
    end

    def rank_name
        case hand_rank
        when 23
            return 'Royal flush!'
        when 22
            return 'Straight flush!'
        when 21
            return 'Four of a Kind!'
        when 20
            return 'Full House!'
        when 19
            return 'Flush!'
        when 18
            return 'Straight!'
        when 17
            return 'Three of a Kind!'
        when 16
            return 'Two-pair!'
        when 15
            return 'One-pair!'
        else
            return 'High card'
        end
    end

    private

    def count_pairs
        faces = set.map {|card| card.face}
        count = 0
        
        faces.each_with_index do |face1,idx1|
            faces.each_with_index do |face2,idx2|
                if idx2 > idx1 && face1 == face2
                    count += 1
                end
            end
        end

        return count
    end

    def count_kind(n)
        faces = set.map { |card| card.face}
        FACES.one? { |face| faces.count(face) == n}
    end

    def suit_count(n)
        suits = set.map {|card| card.suit}
        SUITS.one? { |suit| suits.count(suit) == n}
    end

    def sequential?

        ranks = set.map { |card| card.rank}
        sorted_ranks = ranks.sort
        start_rank = sorted_ranks[0]
        end_rank = sorted_ranks[-1]

        return (sorted_ranks == (start_rank..end_rank).to_a) ? true : false
    end
    


end

