class Ingredient
    attr_accessor :name
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.most_common_allergen
        counter_hash = {}
        self.all_allergens.each do |allergen|
            counter_hash[allergen.name] ||= 0
            counter_hash[allergen.name] += 1
        end
        max_allergen = counter_hash.max_by do |k, v|
            v
        end
        max_allergen[0]
    end

    def self.all
        @@all
    end

    def self.all_allergens
        Allergy.all.map do |allergy|
            allergy.ingredient
        end
    end

end
