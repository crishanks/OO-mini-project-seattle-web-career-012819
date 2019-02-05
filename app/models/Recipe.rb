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

    def self.most_popular
        recipe_hash = {}
        RecipeCard.all.each do |card| 
            exists = recipe_hash[card.recipe] != nil
            if !exists
                recipe_hash[card.recipe] = 1
            else
                recipe_hash[card.recipe] += 1
            end 
        end
        recipe_hash.sort_by{ |key, value| value }.last
      end

    def self.all
        @@all
    end
end
