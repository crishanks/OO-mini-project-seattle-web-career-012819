class User
  @@all = []

  attr_accessor :name

  def initialize(name: "bob")
    @name = name
    @@all << self
  end

  def recipe_cards
    RecipeCard.all.select {|card| card.user == self}
  end

  def recipes
    self.recipe_cards.collect {|card| card.recipe}
  end

  def allergies
    Allergy.all.select {|allergy| allergy.user == self}
  end

  def add_recipe_card(recipe: nil, date: '', rating: 0)
    RecipeCard.new(recipe: recipe, date: date, rating: rating, user: self)
  end

  def declare_allergy(ingredient)
    Allergy.new(user: self, ingredient: ingredient)
  end

  def top_three_recipies
    sorted_recipes = self.recipes.sort_by{|recipe| recipe.rating}.reverse
    sorted_recipes.slice(0,3)
  end

  def most_recent_recipe
    self.recipes.last
  end

  def safe_recipes
    Recipe.all.select do |recipe|
      !recipe.ingredients.any? do |ingredient|
        ingredient.users_allergic_to.include?(self)
      end
    end
  end

  def self.all
    @@all
  end

end
