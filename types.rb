class Type
    def initialize(type,damage_relations)
        @type_name = type
        @double = types_list(damage_relations,'double_damage_to')
        @half = types_list(damage_relations,'half_damage_to')
        @none = types_list(damage_relations,'no_damage_to')
    end
    def types_list(dmg_relations,relation)
        type_list = Array.new
        for type in dmg_relations[0][relation] do
            type_list.push(type['name'])
        end
        type_list
    end
    def calculate_mult(types)
        for type in types do
            if @double.count(type) != 0
                puts "Critical hit!"
                return 1.6
            elsif @half.count(type) != 0
                puts "Not very effective"
                return 0.625
            elsif @none.count(type) != 0
                puts "Attack blocked!"
                return 0.39
            else
                return 1.0
            end
        end
    end
    def get_type_name
        @type_name
    end
end