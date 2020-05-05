class Card
    attr_reader :face, :num, :symbol, :revealed

    def  initialize(face,num,symbol)
        @face = face
        @num = num
        @symbol = symbol
        @revealed = false
    end 
end

class Deck
    FACES = %w[ Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King]
    SYMBOLS =  %w[ Clubs Diamonds Hearts Spades ]
    attr_reader :cards
    def initialize

        @cards = get_cards
    end

    def get_cards
        cards_arr = []
        SYMBOLS.each do |symbol|
            FACES.each_with_index do |face,num|
                cards_arr << Card.new(face,num,symbol)
            end
        end
         cards_arr
    end

    
end
