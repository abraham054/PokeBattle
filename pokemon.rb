require_relative 'types'

class Pokemon
    def initialize(poke_data,type,damage_relations)
        @name =     poke_data['name']
        @hp =       poke_data['stats'][0]['base_stat']
        @hp_left =  poke_data['stats'][0]['base_stat'] 
        @attack =   poke_data['stats'][1]['base_stat']
        @defense =  poke_data['stats'][2]['base_stat']
        @speed =    poke_data['stats'][5]['base_stat']
        @type = Type.new(type,damage_relations)
    end
    # alive:  -> Bool
    # check if a pokemon is alive
    def alive
        return @hp_left > 0
    end
    # recieve_damage: Int Int -> _
    # Makes the pokemon recieve damage, using a version of the original ecuation used in Pokemon games
    def receive_damage(dmg,multiplier)
        dmg = (dmg * ((dmg * 1.0) / @defense )* 2.4 / 10 + 2) * multiplier * rand(85..100)/100
        dmg = dmg.round(1)
        @hp_left -= dmg
        @hp_left = @hp_left.round(1)
        puts "#{@name} received #{dmg} damage"
        if !alive
            puts "#{@name} faded"
        end
    end
    # attack: Pokemon -> _
    # Makes one pokemon attack the other one
    def attack(pokemon)
        if alive()
            puts "#{@name} attacked #{pokemon.get_name}"
            multiplier = @type.calculate_mult(pokemon.get_type_name)
            pokemon.receive_damage(@attack,multiplier)
        else
            puts "#{@name} is too weak to attack now"
        end
    end
    # refill_hp: -> _
    # refills the original hp of a pokemon
    def refill_hp
        @hp_left = @hp
    end
    # to_s: -> String
    # overwrites the to_s method to print more useful information about the pokemon
    def to_s
        "#{@name} [#{@hp_left}/#{@hp}]"
    end
    def get_name
        @name
    end
    def get_speed
        @speed
    end
    def get_type_name
        @type.get_type_name
    end
end