class User
    attr_accessor :name
    @@all =[]

    def initialize(name)
        @name = name
        @@all << self
    end

    def recipe_cards
        RecipeCard.all.select do |recipecard|
            recipecard.user == self
        end
    end

    def recipes
        self.recipe_cards.map do |recipecard|
            recipecard.recipe
        end
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, [ingredient])
    end

    def allergens
        usr_allergies = Allergy.all.select do |allergy|
            allergy.user == self
        end
        usr_allergies.map do |allergy|
            allergy.ingredient
        end
        #method returns entire Ingredient instance. add ".name" for just ingredient names
    end

    def top_three_recipes
        #returns top three rated recipes for user
        top_recipecards = self.recipe_cards.max(3) do |a, b|
            a.rating <=> b.rating
        end
        top_recipecards.map do |recipecard|
            recipecard.recipe
        end
    end

    # def most_recent_recipe
    #not trying this one for time's sake
    # end


    def self.all
        @@all 
    end

end
