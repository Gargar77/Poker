require 'rspec'
require 'Game'

describe Game do 

    describe "#initialize" do 

        it "holds a new deck" do 
            game.deck
        end

        it "holds up to 4 players" do 
            expect(game.players.length).to be < 5
        end

        it "has a discard pile as an attribute" do 
            game.discard_pile
        end

        it "has a @game_pot attribute with a value of zero" do 
            expect(game.game_pot).to eq(0)
        end
    end

    describe "#play" do 
        it "goes through the game logic"
    end
end