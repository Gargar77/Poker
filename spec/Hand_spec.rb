require 'rspec'
require 'Hand'
require 'Deck'


#Hand Pairs (ranked 1-10)
#--
#royal Flush : Ten,Jack,Queen,King,Ace ( all the same suit)
#Straight flush : Five cards in sequential order and of the same suit
#Four of a kind : Four cards of the same face
#full House : Three cards of the same face plus other two cards of the same face
#Flush : Any five cards of the same suit
#straight : Five cards in sequential order
#Three of a kind: three cards of the same face
#two Pair : Two cards of the same face plus other two cards of the same
#pair: two cards of the same face
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
            let(:six_hearts) {Card.new('Six',6,'Hearts')}
            let(:six_spades) {Card.new('Six',6,'Spades')}
            let(:queen) {Card.new('Queen',12,'Hearts')}
            let(:ace) {Card.new('Ace',14,'Spades')}


            let(:small_deck) {[six_hearts,six_spades,queen,ace]}
            let(:hand) {Hand.new(small_deck)}
        it "Returns true if there is exactly one pair" do
             expect(hand.one_pair?).to eq(true)
        end
    end

    describe "#two_pair?" do 
        let(:six_hearts) {Card.new('Six',6,'Hearts')}
        let(:six_spades) {Card.new('Six',6,'Spades')}
        let(:queen_hearts) {Card.new('Queen',12,'Hearts')}
        let(:queen_clubs) {Card.new('Queen',12,'Clubs')}

    
        let(:small_deck) {[six_hearts,six_spades,queen_clubs,queen_hearts]}
        let(:hand) {Hand.new(small_deck)}
        
            it "returns true if there are two pairs in the set" do 
                expect(hand.two_pair?).to eq(true)
            end
    end
    
end



