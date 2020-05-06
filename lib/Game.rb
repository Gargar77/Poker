require_relative "Deck"
require_relative "Player"


class Game
    attr_reader :deck, :discard_pile, :game_pot, :current_bet
    def initialize
        @deck = Deck.new
        @players = []
        @discard_pile = []
        @game_pot = 0
        @current_bet = 0
    end

    def play
           welcome_message
            set_players
            system('clear')
            puts "Lets Begin!!"
            sleep(1)
            system('clear')
            until game_over?
                play_round
            end
    end

    def welcome_message
        puts "welcome Sharks to the Poker game!"
        puts "we will be paying a five-draw Poker"
        puts
    end

    def play_round
        @players.each {|player| get_bet(1,player)}
        @current_bet = 1
        turn
         if folded_players == 2
            collect_pot
            return true
        else
            discard_turn
            return false
        end
    end
class MaxPlayersError < RuntimeError
end
ALPHA = ('a'..'z').to_a + ('A'..'Z').to_a
class InvalidNumberError < RuntimeError
end
    def set_players
        puts "how many players?"

        begin
            input = gets.chomp
            raise MaxPlayersError if input.to_i > 4
            raise InvalidNumberError if ALPHA.include?(input)
            rescue MaxPlayersError
                puts "MAX players is 4!"
            retry
            rescue InvalidNumberError
               puts  "please make sure input is a number!"
               retry
        end
            i = 0
            while i < input.to_i
                puts "Player#{i+1}, please enter your name"
                name = gets.chomp
                @players << Player.new(name,deck)
                i += 1
            end
        end
    end

    def get_bet(n,player)
        amount = player.bet(n.to_i)
        @game_pot += amount
    end

    def turn
        @players.each do |player|
            puts "#{player.name}, what would you like to do?"
            render_options
            puts "current bet: #{@current_bet.to_s}"
            puts "Your Pot: #{player.pot.to_s}"
            status = false
            until status == true

                begin
                    input = gets.chomp
                    status = play_option(player,input)
                    rescue RuntimeError
                        puts "that is an incorrect command :(\nplease try again"
                    retry
                end
            end
        end
    end

    def discard_turn
        @players.each do |player|
            puts "#{player.name}, please select any card you would like to discard by entering the corresponding number"
            puts "IF it is more than one card, please seperate the number by a comma (ex. 1,2,3)"
            player.see_hand
            input = gets.chomp.split(',').map(&:to_i)
            discarded = player.discard(input)
            @discard_pile << discarded
            player.hand.replenish_set
        end
    end


    def render_options
        puts "you can:"
        puts "see : (lets you see your cards)"
        puts "fold\nraise\nbet"
    end

    def play_option(player,input)
        case input

            when "see"
                player.see_hand
                return false
            when "fold"
                player.fold_hand
                system('clear')
                return true
            when "bet"
                get_bet(current_bet,player)
                system('clear')
                return true
            when "raise"
                raise_bet(player)
                system('clear')
                return true
            else raise RuntimeError
        end
    end

    def raise_bet(player)
        puts
        puts
        puts "how much will you raise?"
        puts "NOTE: amount must be larger than the current bet"
        puts "Current bet: #{@current_bet.to_s}"

            begin
                input = gets.chomp
                valid_raise?(input.to_i)
            rescue RuntimeError
                puts "please make sure the value is greater than #{current_bet.to_s}!"
                retry
            end
        amount = player.raise_bet(input.to_i)
        @current_bet = amount
        @game_pot += amount
    end

    def valid_raise?(n)
        raise RuntimeError if n <= @current_bet
        true
    end

    def collect_pot
       unfolded_players = []

        @players.each do |player|
            if player.fold == false
                unfolded_players << player
            end
        end

        if unfolded_players[0].hand.hand_rank > unfolded_players[1].hand.hand_rank
            puts "#{player[0].name} you won the POT! you gain #{@game_pot.to_s}"
            puts "you had #{unfolded_players[0].hand.rank_name}"
            unfolded_players[0].see_hand
            unfolded_players[0].pot += @game_pot
        else
            puts "#{player[1].name} you won the POT! you gain #{@game_pot.to_s}"
            puts "you had #{unfolded_players[1].hand.rank_name}"
            unfolded_players[1].see_hand
            unfolded_players[1].pot += @game_pot
        end  
    end

    def folded_players
        fold_count = 0
        @players.each do |player|
            fold_count += 1 if player.fold == true
        end
        fold_count
    end

    def game_over?
        @players.one? {|player| player.pot > 0}
    end

g = Game.new
g.play