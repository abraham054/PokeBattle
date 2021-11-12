require_relative 'pokeapi'

class Battle
    def fight(match)
        faster = Array.new
        if match[0].get_speed > match[1].get_speed
            faster.push(match[0])
            faster.push(match[1])
        else
            faster.push(match[1])
            faster.push(match[0])
        end
        puts "\n New Fight between #{faster[0].get_name} and #{faster[1].get_name}!"
        while faster[0].alive and faster[1].alive
            puts "\n New round!"
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