class Allergy
    @@all = []
    attr_accessor :user, :ingredient

    def initialize(user: nil, ingredient: nil)
        @user = user
        @ingredient = ingredient

        @@all << self
    end

    def self.all 
        @@all
    end
end