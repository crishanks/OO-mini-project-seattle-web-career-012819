class Ingredient
    @@all = []
    attr_reader :name

    def initialize(name: '')
        @name = name
        @@all << self
    end

    def allergies
        Allergy.all.select {|allergy| allergy.ingredient == self}
    end

    def users_allergic_to
        self.allergies.collect {|allergy| allergy.user}
    end

    def self.most_common_allergy
        self.all.max_by do |ingredient|
            ingredient.allergies.count
        end
    end

    def allergen?
        !self.allergies.empty?
    end

    def self.all
        @@all
    end

end
