require_relative "Hand"
class Player
    attr_reader :hand, :fold, :pot, :name
    attr_accessor :pot
    def initialize(name,deck)
        @name = name
        @hand = Hand.new(deck)
        @fold = false
        @pot = 1000
    end

    def fold_hand
        @fold = true
    end

    def see_hand
        set = hand.set
        set.each_with_index do |card,index|
            puts "#{(index).to_s} || #{card.face} of #{card.suit}"
        end
    end

    def raise_bet(n)
        max_amount = @pot
        if max_amount - n <= 0
            puts "YOU WENT ALL IN"
            sleep(2)
            pot = 0
            return max_amount
        end
        @pot -= n
        return n 
    end

    def bet(n)
        max_amount = @pot
        if max_amount - n <= 0
            puts "YOU WENT ALL IN"
            sleep(2)
            pot = 0
            return max_amount
        end

        @pot -= n
        return n
    end

    def valid_index?(index)
        return true if index.between?(0,5)
        false
    end

    def discard(index_arr)
        return [] if index_arr == []
        discarded = []
        
        index_arr.each do |idx|
            discarded << hand.set[idx]
            hand.set.delete_at(idx)
        end
        discarded
    end

end
