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
        @pokedex = consume_api('https://pokeapi.co/api/v2/pokemon?limit=151')
    end
    def shuffle
        for i in 0..8 do
            num = rand(1..151)
            url = "https://pokeapi.co/api/v2/pokemon/#{num}"
            poke_data = consume_api(url)
            pokemon = Pokemon.new(poke_data)
            @contenders.push(pokemon)
        end
    end
    def get_contenders
        @contenders
    end
end

prep = Preparation.new
prep.shuffle
puts prep.get_contenders