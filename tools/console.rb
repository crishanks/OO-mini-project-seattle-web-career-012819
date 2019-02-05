require_relative '../config/environment.rb'

hamburger = Recipe.new(name: "Hamburger")
spaghetti = Recipe.new(name: "Spaghetti")
omlette = Recipe.new(name: "Omlette")

chef_greg = User.new(name: "Greg")
chef_katy = User.new(name: "Katy")
chef_tim = User.new(name: "Tim")

rc1 = RecipeCard.new(chef_greg, hamburger, DateTime.now, 5)
rc2 = RecipeCard.new(chef_katy, omlette, DateTime.now, 8)
rc3 = RecipeCard.new(chef_tim, spaghetti, DateTime.now, 3)
rc4 = RecipeCard.new(chef_greg, spaghetti, DateTime.now, 10)
rc5 = RecipeCard.new(chef_greg, omlette, DateTime.now, 7)
rc6 = RecipeCard.new(chef_greg, omlette, DateTime.now, 8)

flour = Ingredient.new("Flour")
sugar = Ingredient.new("sugar")
eggs = Ingredient.new("eggs")

rash = Allergy.new(chef_greg, flour)
hives = Allergy.new(chef_katy, flour)
itch = Allergy.new(chef_greg, eggs)

ri1 = RecipeIngredient.new(hamburger, flour)
ri2 = RecipeIngredient.new(hamburger, eggs)
ri3 = RecipeIngredient.new(spaghetti, flour)



binding.pry
