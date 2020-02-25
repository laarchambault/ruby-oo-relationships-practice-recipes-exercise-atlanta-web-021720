class RecipeIngredient
    attr_accessor :recipe, :ingredient
    @@all = []


    def initialize(recipe, ingredient)
        @ingredient = []
        @recipe = recipe
        ingredient.each do |ingredient|
            @ingredient << ingredient
        end
        @@all << self
    end

    def self.all
        @@all
    end
end
