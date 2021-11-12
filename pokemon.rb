class Pokemon
    def initialize(poke_data)
        data = clean_data(poke_data)
        @name = data[0]
        @hp = data[1]
        @attack = data[2]
        @defense = data[3]
        @speed = data[4]
    end
    def clean_data(poke_data)
        data = Array.new
        data.push(poke_data['name'])
        data.push(poke_data['stats'][0]['base_stat'])
        data.push(poke_data['stats'][1]['base_stat'])
        data.push(poke_data['stats'][2]['base_stat'])
        data.push(poke_data['stats'][5]['base_stat'])
        data
    end
    def alive
        return @hp > 0
    end
    def receive_damage(dmg)
        attack = dmg - @defense
        if attack <= 0
            attack = dmg / 3
        end
        @hp -= attack
        puts "#{@name} received #{attack} damage"
        if !alive
            puts "#{@name} faded"
        end
    end
    def attack(pokemon)
        if alive()
            puts "#{@name} attacked #{pokemon.get_name}"
            pokemon.receive_damage(@attack)
        else
            puts "#{@name} is too weak to attack now"
        end
    end
    def get_name
        @name
    end
    def get_hp
        @hp
    end
    def get_attack
        @attack
    end
    def get_defense
        @defense
    end
    def get_speed
        @speed
    end
end