class Recipe
    attr_accessor :name
    attr_writer
    attr_reader

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.most_popular
        counter = {}
        RecipeCard.all.each do |recipecard| 
            counter[recipecard.recipe] ||= 0
            counter[recipecard.recipe] += 1
        end
        mp = counter.max_by{|key, value| value}
        mp[0]
    end

    def users 
        recipe_array = RecipeCard.all.select {|recipecard| recipecard.recipe == self}
        recipe_array.collect{|recipecard| recipecard.user}
    end

    def ingredients
        ingredients_array = RecipeIngredient.all.select do |recipecard|
            recipecard.recipe == self
        end
        ingred_arr_to_flatten = ingredients_array.map do |recipeingredient|
            recipeingredient.ingredient
        end
        ingred_arr_to_flatten.flatten
    end

    def allergens
        this_recipe_ingredients = self.ingredients
        all_allergen_ingredients = Ingredient.all_allergens
        this_recipe_ingredients & all_allergen_ingredients
    end

    def add_ingredients(ingredients)
        #this method will create a new RecipeIngredient, but cannot be used to add ingredients to existing RecipeIntredients
        RecipeIngredient.new(self, ingredients)
    end


    def self.all
        @@all
    end

end
