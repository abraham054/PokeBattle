require_relative 'pokeapi'

class Battle
    def fight(match)
        faster = Array.new
        if match[0].get_speed > match[1].get_speed
            faster.push(match[0],match[1])
        else
            faster.push(match[1],match[0])
        end
        puts "-------------------------------------------------\n"
        puts "New Fight between #{faster[0].get_name} and #{faster[1].get_name}!"
        faster[0].refill_hp        
        faster[1].refill_hp
        while faster[0].alive and faster[1].alive
            puts "New round!"
            puts "#{faster[0]} vs. #{faster[1]}"
            faster[0].attack(faster[1])
            faster[1].attack(faster[0])
        end
        if faster[0].alive
            faster[0]
        else
            faster[1]
        end
    end
end