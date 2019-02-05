require 'pry'

class Ingredient
    @@all = []
    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def allergies
        Allergy.all.select {|allergy| allergy.ingredient == self}
    end

    def users
        self.allergies.map do |allergy|
            allergy.user
        end
    end

    def self.most_common_allergy
        allergens = {}
        RecipeIngredient.all.each do |recipe_ingredient|
            exists = allergens[recipe_ingredient.ingredient] != nil
            if !exists
                allergens[recipe_ingredient.ingredient] = 1
            else
                allergens[recipe_ingredient.ingredient] += 1
            end
        end
        allergens.sort_by {|key, value| value}.last
        # binding.pry
    end

    def self.all
        @@all
    end
end
