class Recipe
    @@all = []
    attr_accessor :name

    def initialize(name: '')
        @name = name
        @@all << self
    end

    def recipe_cards
        RecipeCard.all.select {|card| card.recipe == self}
    end

    def recipe_ingredients
        RecipeIngredient.all.select {|ri| ri.recipe == self}
    end

    def users
        self.recipe_cards.collect do |card|
            card.user
        end
    end

    def ingredients
        self.recipe_ingredients.collect do |ri|
            ri.ingredient
        end
    end

    def add_ingredients(ing_arr)
        ing_arr.each do |ingredient|
            RecipeIngredient.new(recipe: self, ingredient: ingredient)
        end
    end

    def allergens
        self.ingredients.select {|ingredient| ingredient.allergen?}
    end

    def self.most_popular
      self.all.max_by {|recipe| recipe.users.count}
    end

    def self.all
        @@all
    end
end
