require_relative 'battle'

class Tournament
    def initialize
        puts "Let's begin the pokemon tournament!"
        prep = Preparation.new
        prep.shuffle
        @fighters = prep.get_contenders
        @battler = Battle.new
    end
    def simulate
        while @fighters.length != 1
            branches
            print "\nThe victory is for "
            for champion in @fighters do
                print "#{champion.get_name} "
            end
            puts "\nPress anything to continue"
            gets
        end
        puts "The tournament's winner is #{@fighters[0].get_name}"
    end
    def branches
        matches = divide
        winners = Array.new
        for match in matches do
            winners.push(@battler.fight(match))
        end
        @fighters = winners
    end
    def divide
        branch = Array.new
        fighters = @fighters
        for i in 0..(fighters.length/2-1) do
            branch.push([fighters[2*i],fighters[2*i+1]])
        end
        branch
    end
end

Tournament.new.simulate