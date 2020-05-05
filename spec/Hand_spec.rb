require 'rspec'
require 'Hand'
require 'Deck'


#Hand Pairs (ranked 1-10)
#--
#High card: a hand with no other combination, valued by the highest ranked card
#--

describe Hand do 

    describe "#initialize" do
      let(:deck) {Deck.new}
      let(:hand) {Hand.new(deck)}
      let(:other_hand) {Hand.new(deck)}

        it "takes in an existing Deck as an arg and sets it as attribute" do
            hand.deck
            expect(hand.deck).to eq(other_hand.deck)
        end
    
        it "initialized with a random set of 5 cards from the deck" do
            hand.set
            expect(hand.set.length).to eq(5) 
        end
    end

    describe "#one_pair?" do
    #pair: two cards of the same face
            let(:ace_spades) {Card.new('Ace',14,'Spades')} 
            let(:six_hearts) {Card.new('Six',6,'Hearts')}
            let(:six_spades) {Card.new('Six',6,'Spades')}
            let(:queen) {Card.new('Queen',12,'Hearts')}
            let(:ace_hearts) {Card.new('Ace',14,'Hearts')}


            let(:small_deck) {[six_hearts,six_spades,queen,ace_hearts,ace_spades]}
            let(:hand) {Hand.new(small_deck)}
        it "Returns true if there is exactly one pair" do
             expect(hand.one_pair?).to eq(true)
        end
    end

    describe "#two_pair?" do 
        #two Pair : Two cards of the same face plus other two cards of the same
        let(:ace_spades) {Card.new('Ace',14,'Spades')}
        let(:six_hearts) {Card.new('Six',6,'Hearts')}
        let(:six_spades) {Card.new('Six',6,'Spades')}
        let(:queen_hearts) {Card.new('Queen',12,'Hearts')}
        let(:queen_clubs) {Card.new('Queen',12,'Clubs')}

    
        let(:small_deck) {[six_hearts,six_spades,queen_clubs,queen_hearts,ace_spades]}
        let(:hand) {Hand.new(small_deck)}
        
            it "returns true if there are two pairs in the set" do 
                expect(hand.two_pair?).to eq(true)
            end
    end

    describe "#three_of_a_kind?" do 
        #Three of a kind: three cards of the same face
        let(:ace_hearts) {Card.new('Ace',14,'Hearts')}
        let(:ace_spades) {Card.new('Ace',14,'Spades')}
        let(:six_hearts) {Card.new('Six',6,'Hearts')}
        let(:queen_diamonds) {Card.new('Queen',12,'Diamonds')}
        let(:queen_hearts) {Card.new('Queen',12,'Hearts')}
        let(:queen_clubs) {Card.new('Queen',12,'Clubs')}

        let(:small_deck) {[six_hearts,ace_spades,queen_clubs,queen_hearts,queen_diamonds]}
        let(:hand) {Hand.new(small_deck)}

        it "returns true if there are 3 of a kind" do 
            expect(hand.three_of_a_kind?).to eq(true)
        end

        it "returns false if the other two cards are a pair" do 
            new_deck = [ace_hearts,ace_spades,queen_clubs,queen_diamonds,queen_hearts]
            new_hand = Hand.new(new_deck)

            expect(new_hand.three_of_a_kind?).to eq(false)
        end
    end

    describe "#straight?" do 
        #straight : Five cards in sequential order
        let(:ten_spades) {Card.new('Ten',10,'Spades')}
        let(:jack_spades) {Card.new('Jack',11,'Spades')}
        let(:eight_spades) {Card.new('Eight',8,'Spades')}
        let(:nine_spades) {Card.new('Nine',9,'Spades')}
        let(:ten_diamonds) {Card.new('Ten',10,'Diamonds')}
        let(:jack_diamonds) {Card.new('Jack',11,'Diamonds')}
        let(:queen_spades) {Card.new('Queen',12,'Spades')}

        let(:small_deck) {[eight_spades,nine_spades,ten_diamonds,jack_diamonds,queen_spades]}
        let(:hand) {Hand.new(small_deck)}

        it "returns true if the set is a straight" do 
            expect(hand.straight?).to eq(true)
        end

        it "should have at least two different suits" do
            new_deck = [ten_spades,jack_spades,eight_spades,nine_spades,queen_spades]
            new_hand = Hand.new(new_deck)

            expect(new_hand.straight?).to eq(false)
        end
    end

    describe "#flush?" do  
        #Flush : Any five cards of the same suit but not in sequence
        let(:king_spades) {Card.new('King',13,'Spades')}
        let(:jack_spades) {Card.new('Jack',11,'Spades')}
        let(:seven_spades) {Card.new('Seven',7,'Spades')}
        let(:nine_spades) {Card.new('Nine',9,'Spades')}
        let(:three_spades) {Card.new('Three',3,'Spades')}

        let(:small_deck) {[king_spades,jack_spades,seven_spades,nine_spades,three_spades]}
        let(:hand) {Hand.new(small_deck)}

        it "should return true if the set is a flush" do 
            expect(hand.flush?).to eq(true)
        end

        it "must not be in sequence" do 
            ten_spades = Card.new('Ten',10,'Spades')
            jack_spades = Card.new('Jack',11,'Spades')
            eight_spades = Card.new('Eight',8,'Spades')
            nine_spades = Card.new('Nine',9,'Spades')
            queen_spades =Card.new('Queen',12,'Spades')

            new_deck = [ten_spades,jack_spades,eight_spades,nine_spades,queen_spades]
            new_hand = Hand.new(new_deck)

            expect(new_hand.flush?).to eq(false)
        end
    end

    describe "#straight_flush?" do 
    #straight Flush: five cards in sequence and of the same suit
        let(:ten_spades) {Card.new('Ten',10,'Spades')}
        let(:jack_spades) {Card.new('Jack',11,'Spades')}
        let(:eight_spades) {Card.new('Eight',8,'Spades')}
        let(:nine_spades) {Card.new('Nine',9,'Spades')}
        let(:queen_spades) {Card.new('Queen',12,'Spades')}

        
        let(:small_deck) {[ten_spades,jack_spades,eight_spades,nine_spades,queen_spades]}
        let(:hand) {Hand.new(small_deck)}


        it "returns true when the set is a straight_flush" do
            expect(hand.straight_flush?).to eq(true)
        end 

    end

    describe "#four_of_a_kind?" do 
        #Four of a kind : Four cards of the same face
        let(:queen_diamonds) {Card.new('Queen',12,'Diamonds')}
        let(:queen_hearts) {Card.new('Queen',12,'Hearts')}
        let(:queen_clubs) {Card.new('Queen',12,'Clubs')}
        let(:ace_hearts) {Card.new('Ace',14,'Hearts')}
        let(:queen_spades) {Card.new('Queen',12,'Spades')}

        let(:small_deck) {[queen_diamonds,queen_hearts,queen_clubs,ace_hearts,queen_spades]}
        let(:hand) {Hand.new(small_deck)}

        it "returns true if there are four of a kind" do 
            expect(hand.four_of_a_kind?).to eq(true)
        end
    end

    describe "#full_house?" do 

        #full House : three of a kind with a pair
        let(:ace_hearts) {Card.new('Ace',14,'Hearts')}
        let(:ace_spades) {Card.new('Ace',14,'Spades')}
        let(:queen_diamonds) {Card.new('Queen',12,'Diamonds')}
        let(:queen_hearts) {Card.new('Queen',12,'Hearts')}
        let(:queen_clubs) {Card.new('Queen',12,'Clubs')}

        let(:small_deck) {[ace_hearts,ace_spades,queen_diamonds,queen_hearts,queen_clubs]}
        let(:hand) {Hand.new(small_deck)}

        it "returns true if the set is a full house" do 
            expect(hand.full_house?).to eq(true)
        end
    end

    describe "#royal_flush?" do 
        #Royal flush: A,K,Q,J,10 with the same suit
        let(:king_spades) {Card.new('King',13,'Spades')}
        let(:jack_spades) {Card.new('Jack',11,'Spades')}
        let(:ten_spades) {Card.new('Ten',10,'Spades')}
        let(:queen_spades) {Card.new('Queen',12,'Spades')}
        let(:ace_spades) {Card.new('Ace',14,'Spades')}

        let(:king_clubs) {Card.new('King',13,'Clubs')}
        let(:jack_clubs) {Card.new('Jack',11,'Clubs')}
        let(:ten_clubs) {Card.new('Ten',10,'Clubs')}
        let(:queen_clubs) {Card.new('Queen',12,'Clubs')}
        let(:ace_clubs) {Card.new('Ace',14,'Clubs')}

        let(:deck1) {[king_spades,jack_spades,ten_spades,queen_spades,ace_spades]}
        let(:deck2) {[king_clubs,jack_clubs,ten_clubs,queen_clubs,ace_clubs]}
        let(:hand1) {Hand.new(deck1)}
        let(:hand2) {Hand.new(deck2)}

        it "should return true if the set is a royal flush" do
            expect(hand1.royal_flush?).to eq(true)
            expect(hand2.royal_flush?).to eq(true)
        end

    end

    describe "#high_card" do 
        let(:king_clubs) {Card.new('King',13,'Clubs')}
        let(:jack_clubs) {Card.new('Jack',11,'Clubs')}
        let(:ten_clubs) {Card.new('Ten',10,'Clubs')}
        let(:queen_clubs) {Card.new('Queen',12,'Clubs')}
        let(:ace_clubs) {Card.new('Ace',14,'Clubs')}

        let(:small_deck) {[ace_hearts,ace_spades,queen_diamonds,queen_hearts,queen_clubs]}
        let(:hand) {Hand.new(small_deck)}

        it "returns the highest rank in the set" do 
            expect(hand.high_card).to eq(ace_clubs)
        end
    end

    describe "#hand_rank" do 

        # High Card(2-14), One pair(15), two Pair(16),Three of a kind(17)
        # Straight(18), Flush(19), Full House (20), Four of a kind(21), Straight flush(22)
        # Royal Flush(23) 
        
        let(:ace_hearts) {Card.new('Ace',14,'Hearts')}
        let(:ace_spades) {Card.new('Ace',14,'Spades')}
        let(:queen_diamonds) {Card.new('Queen',12,'Diamonds')}
        let(:queen_hearts) {Card.new('Queen',12,'Hearts')}
        let(:queen_clubs) {Card.new('Queen',12,'Clubs')}
        let(:deck_full_house) {[ace_hearts,ace_spades,queen_diamonds,queen_hearts,queen_clubs]}

        let(:king_hearts) {Card.new('King',13,'Hearts')}
        let(:seven_diamonds) {Card.new('Seven',7,'Diamonds')}
        let(:queen_diamonds) {Card.new('Queen',12,'Diamonds')}
        let(:three_clubs) {Card.new('Three',3,'Clubs')}
        let(:two_hearts) {Card.new('two',2,'Hearts')}
        let(:deck_high_card) {[king_hearts,seven_diamonds.queen_diamonds,three_clubs,two_hearts]}

        it "returns an integer value equal equal to the rank of the current hand" do 
            hand_full_house = Hand.new(deck_full_house)
            hand_high_card = Hand.new(deck_high_card)

            expect(hand_full_house.hand_rank).to eq(20)
            expect(hand_high_card.hand_rank).to eq(13)
        end
    end



end



