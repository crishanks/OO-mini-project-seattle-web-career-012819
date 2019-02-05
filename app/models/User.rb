class User
  @@all = []
  attr_reader :name

  def initialize(name)
      @name = name
      @@all << self
  end

  def recipe_cards
      RecipeCard.all.select {|card| card.user == self}
      #return an array of all the recipe cards that belong to this user
  end

  def recipes
      self.recipe_cards.map {|card| card.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def top_three_recipes
    recipe_hash = {}
    self.recipe_cards.each do |card| 
      recipe_hash[card.recipe] = card.rating
    end
    recipe_hash.sort_by{ |key, value| value }.last(3)
  end

  def most_recent_recipe
    self.recipes.last
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergies
    Allergy.all.select {|allergy| allergy.user == self}
  end

  def self.all
      @@all
  end
end

