class Card
    attr_reader :face, :rank, :suit, :revealed

    def  initialize(face,rank,suit)
        @face = face
        @rank = rank
        @suit = suit
        @revealed = false
    end 
end

class Deck
    FACES = %w[Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace]
    SUITS =  %w[ Clubs Diamonds Hearts Spades ]
    attr_reader :cards
    def initialize
        @cards = get_cards.shuffle
    end

    def get_cards
        cards_arr = []
        SUITS.each do |suit|
            FACES.each_with_index do |face,num|
                cards_arr << Card.new(face,(num+2),suit)
            end
        end
         cards_arr
    end

    
end
