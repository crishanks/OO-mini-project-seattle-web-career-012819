class RecipeCard
    @@all = []
    attr_accessor :recipe, :user, :date, :rating

    def initialize(recipe: nil, user: nil, date: 'date', rating: 'rating')
        @recipe = recipe
        @user = user
        @date = date
        @rating = rating

        @@all << self
    end

    def self.all 
        @@all
    end
end