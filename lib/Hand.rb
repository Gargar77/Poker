require_relative 'Deck'
require 'byebug'
class Hand
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

    def one_pair?
        faces = set.map {|card| card.face}
        count = 0
        
        faces.each_with_index do |face1,idx1|
            faces.each_with_index do |face2,idx2|
                if idx2 > idx1 && face1 == face2
                    count += 1
                end
            end
        end
        return count == 1 ? true : false
    end
end




