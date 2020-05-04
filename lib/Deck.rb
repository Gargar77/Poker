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
    def initialize
        
    end
end