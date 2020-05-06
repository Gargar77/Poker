require 'rspec'
require 'Player'

#each player has a hand, plus a pot
#player can decide which cards to discard
#player can decide wether to fold,see hand, or raise
describe Player do 
    
    let(:new_deck) {Deck.new}
    let(:game) {double("main game")}
    let(:hand) {double("sample hand", :deck => new_deck)}
    subject(:player) {Player.new("George",new_deck)}

    describe "#initialize" do 
        it "sets player hand" do 
            player.hand
        end

        it " sets @fold and gives it false" do 
            expect(player.fold).to eq (false)
        end

        it  "sets @pot to and integer value 1000" do 
            expect(player.pot).to eq (1000)
        end
    end

    describe "#fold_hand" do 

        it "it sets fold value to true" do
            player.fold_hand
            expect(player.fold).to eq(true)
        end
    end

    describe "#see_hand" do 
        it "renders the current cards with respective index" do
            player.see_hand
        end
    end

    describe "#raise_bet(n)" do 

        it "takes from the pot" do
            original_pot = player.pot 
            player.raise_bet(100)
            expect(player.pot).to eq(900)
        end

        it "returns raise value" do 
            expect(player.raise_bet(100)).to eq(100)
        end
    end

    describe "#bet(n)" do 

        it "it takes the value from the pot" do 
            player.bet(100)
            expect(player.pot).to eq(900)
        end
        it "returns bet value" do 
            player.bet(100)
            expect(player.bet(100)).to eq(100)
        end
    end

    describe "valid_index?(index)?" do 
        it "makes sure the input is a valid index" do 
            expect(player.valid_index?(10)).to eq(false)
            expect(player.valid_index?(3)).to eq(true)
        end
    end

    describe "#discard(index*)" do

        it "can accept any number of args" do 
            player.discard(1)
            player.discard(2,3)
        end
        
        it "will remove the cards from hand based on inde(x/cies) chosen" do
            card1 = player.hand.set[1]
            card2 = player.hand.set[3] 
            player.discard(1,3)

            expect(player.hand.set[1]).to_not eq(card1)
            expect(player.hand.set[3]).to_not eq(card2)
        end

        it "will return the disarded cards as an array" 
    end

end