require 'rest-client'
require 'json'
require_relative 'pokemon'

def consume_api(url)
    response = RestClient.get(url)
    JSON.parse(response.to_str)
end

class Preparation
    def initialize
        @contenders = Array.new
    end
    def shuffle
        for i in 0..8 do
            num = rand(1..151)
            url_data = "https://pokeapi.co/api/v2/pokemon/#{num}"
            poke_data = consume_api(url_data)
            type_data = get_type_data(poke_data['types'])
            type = type_data[0]
            damage_relations = type_data[1]
            pokemon = Pokemon.new(poke_data,type,damage_relations)
            @contenders.push(pokemon)
        end
    end
    def get_type_data(list_types)
        types = Array.new
        dmg_relations = Array.new
        for data in list_types do
            url = data['type']['url']
            type_name = data['type']['name']
            types.push(type_name)
            type_data = consume_api(url)
            dmg_relations.push(type_data['damage_relations'])
        end
        [types,dmg_relations]
    end
    def get_contenders
        @contenders
    end
end

Preparation.new.shuffle