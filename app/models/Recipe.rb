class Recipe
    @@all = []
    attr_reader :name
 
    def initialize(name)
        @name = name
        @@all << self
    end

    def recipe_cards
        RecipeCard.all.select {|card| card.recipe == self}
        #return an array of all the recipe cards that belong to this recipe
    end

    def users
        self.recipe_cards.map {|card| card.user}
    end

    def self.all
        @@all
    end
end
