require 'rspec'
require 'Deck'


describe Class do

    describe '#initialize' do
     subject(:card) {Card.new('Queen',12,'Hearts')}

     it "should accept a face,number, and suit" do
      card
    end

      it "should set face initializer" do 
        expect(card.face).to eq('Queen')
      end

      it "should set number initializer" do 
        expect(card.num).to eq(12)
      end

      it "should set a suit initializer" do
        expect(card.suit).to eq('Hearts')
      end

      it "should initilaize @revealed and set it to false" do
      expect(card.revealed).to eq(false)
      end
    end

    describe Deck do


        describe "#initilaize" do 
        let(:deck) {Deck.new}
        let(:queen) {"Queen"}
        let(:jack) {"Jack"}
        let(:king) {"King"}
        let(:ace) {"Ace"}
        let(:two) {"Two"}
        let(:three) {"Three"}

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
                suits =  %w[ Clubs Diamonds Hearts Spades]

                jacks = cards.select {|card| card.face == jack}
                queens = cards.select {|card| card.face == queen}
                kings = cards.select {|card| card.face == king}
                aces = cards.select {|card| card.face == ace}
                twos = cards.select {|card| card.face == two}
                threes = cards.select {|card| card.face == three}

      


                
                expect(jacks.all?{ |card| suits.include?(card.suit)}).to eq(true)
                expect(queens.all?{ |card| suits.include?(card.suit)}).to eq(true)
                expect(kings.all?{ |card| suits.include?(card.suit)}).to eq(true)
                expect(aces.all?{ |card| suits.include?(card.suit)}).to eq(true)
                expect(twos.all?{ |card| suits.include?(card.suit)}).to eq(true)
                expect(threes.all?{ |card| suits.include?(card.suit)}).to eq(true)
            end

            it "each card type should have the correct corresponng number as an integer" do
                cards = deck.instance_variable_get(:@cards)
                jacks = cards.select {|card| card.face == jack}
                queens = cards.select {|card| card.face == queen}
                kings = cards.select {|card| card.face == king}

                expect(jacks.all?{|card| card.num == 11})
                expect(queens.all?{|card| card.num == 12})
                expect(kings.all?{|card| card.num == 13})
            end

            
        end
    end
            
end