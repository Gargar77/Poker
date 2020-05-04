require 'rspec'
require 'Deck'


describe Class do

    describe '#initialize' do
     subject(:card) {Card.new('Queen',12,'Hearts')}

     it "should accept a face,number, and symbol" do
      card
    end

      it "should set face initializer" do 
        expect(card.face).to eq('Queen')
      end

      it "should set number initializer" do 
        expect(card.num).to eq(12)
      end

      it "should set a symbol initializer" do
        expect(card.symbol).to eq('Hearts')
      end

      it "should initilaize @revealed and set it to false" do
      expect(card.revealed).to eq(false)
      end
    end

    describe Deck do
        let(:deck) {Deck.new}
        let(:queen) {"Queen"}
        let(:jack) {"Jack"}
        let(:King) {"King"}
        let(:ace) {"Ace"}
        let(:two) {"Two"}
        let(:three) {"Three"}


        describe "#initilaize" do 
            it "should set a cards initializer" do
                deck.cards
            end

            it "should create an array of Card class instances totaling 52" do 
                cards = deck.instance_variable_get(:@cards)
                expect(cards.length).to eq(52)
                cards.each do |card|
                    expect(card.class).to eq(Card)
                end
            end

            it "cards should have exactly 4 of each face" do
                cards = deck.instance_variable_get(:@cards)
                faces = cards.map { |card| card.face }

                expect(faces.count(queen)).to eq(4)
                expect(faces.count(king)).to eq(4)
                expect(faces.count(jack)).to eq(4)
                expect(faces.count(ace)).to eq(4)
                expect(faces.count(two)).to eq(4)
                expect(faces.count(three)).to eq(4)
            end

            it "each face has exaclty one 'Clubs', 'Diamonds', 'Hearts', and 'Spades' in the deck" do
                cards = deck.instance_variable_get(:@cards)
                symbols = %w[ 'Clubs' 'Diamonds' 'Hearts' 'Spades']

                jacks = cards.select {|card| card.face == jack}
                queens = cards.select {|card| card.face == queen}
                kings = cards.select {|card| card.face == king}
                aces = cards.select {|card| card.face == ace}
                twos = cards.select {|card| card.face == two}
                threes = cards.select {|card| card.face == three}

                expect(jacks.all?{ |symbol| symbols.include?(symbol)}).to eq(true)
                expect(queens.all?{ |symbol| symbols.include?(symbol)}).to eq(true)
                expect(kings.all?{ |symbol| symbols.include?(symbol)}).to eq(true)
                expect(aces.all?{ |symbol| symbols.include?(symbol)}).to eq(true)
                expect(twos.all?{ |symbol| symbols.include?(symbol)}).to eq(true)
                expect(threes.all?{ |symbol| symbols.include?(symbol)}).to eq(true)
            end
        end
    end
            
end