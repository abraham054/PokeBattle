require_relative 'battle'

class Tournament
    # Sets up all the necessary stuff to begin the tournament
    def initialize
        prep = Preparation.new
        prep.shuffle
        puts "Let's begin the pokemon tournament!\nPress enter to continue"
        gets
        @fighters = prep.get_contenders
        @battler = Battle.new
    end
    # simulate:
    # simulates the tournament, 8 pokemons only one winner
    def simulate
        while @fighters.length != 1
            bracket
            print "\nThe victory is for "
            for champion in @fighters do
                print "#{champion.get_name} "
            end
            puts "\n-------------------------------------------------"
            puts "\nPress enter to continue"
            gets
        end
        puts "-------------------------------------------------"
        puts "\nThe tournament's winner is #{@fighters[0].get_name}"
        puts "\n-------------------------------------------------"
    end
    # bracket:  -> _
    # Simulates every battle in a bracket and updates the fighters left,
    # 4 fights first, 2 afterwards and then the grand final!
    def bracket
        matches = divide
        winners = Array.new
        for match in matches do
            winners.push(@battler.fight(match))
        end
        @fighters = winners
    end
    # divide:  -> Array
    # divides an array of pokemon in brackets of 1vs1, at first with 8 pokemons returns an array of 4 1vs1
    def divide
        bracket = Array.new
        fighters = @fighters
        for i in 0..(fighters.length/2-1) do
            bracket.push([fighters[2*i],fighters[2*i+1]])
        end
        bracket
    end
end

Tournament.new.simulate