class Card
    attr_reader :face, :num, :suit, :revealed

    def  initialize(face,num,suit)
        @face = face
        @num = num
        @suit = suit
        @revealed = false
    end 
end

class Deck
    FACES = %w[ Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King]
    SUITS =  %w[ Clubs Diamonds Hearts Spades ]
    attr_reader :cards
    def initialize
        @cards = get_cards
    end

    def get_cards
        cards_arr = []
        SUITS.each do |suit|
            FACES.each_with_index do |face,num|
                cards_arr << Card.new(face,num,suit)
            end
        end
         cards_arr
    end

    
end
