require_relative '../config/environment.rb'

#Users
laura = User.new("Laura")
vince = User.new("Vince")
dellys = User.new("Dellys")
#Recipes
chicken_soup = Recipe.new("Chicken soup")
chili = Recipe.new("Chili")
grilled_cheese = Recipe.new("Grilled cheese")
#Ingredients
paprika = Ingredient.new("paprika")
cheese = Ingredient.new("cheese")
tomato = Ingredient.new("tomato")
#Allergies
allergy1 = Allergy.new(laura, paprika)
allergy2 = Allergy.new(vince, tomato)
allergy3 = Allergy.new(dellys, paprika)
#RecipeCards
one = RecipeCard.new(laura, chicken_soup, "Jan 10", 4 )
two = RecipeCard.new(vince, chicken_soup, "Feb 2", 1)
three = RecipeCard.new(dellys, chili, "Jan 27", 5)
one_more = RecipeCard.new(laura, chili, "Jan 19", 4.5)
two_more = RecipeCard.new(laura, grilled_cheese, "April 14", 3)
#RecipeIngredients
uno = RecipeIngredient.new(chicken_soup, [paprika, tomato])
dos = RecipeIngredient.new(chili, [tomato])
tres = RecipeIngredient.new(grilled_cheese, [paprika, cheese])

binding.pry
