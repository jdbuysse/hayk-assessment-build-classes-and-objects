 require 'pry'

# Build a Ruby class for a Building that:

# Initializes with a name, address, number of floors, and number of tenants
# The name and number of tenants should be readable and writeable
# The address should be readable
# The number of floors should not be readable or writeable
# The class should keep track of all buildings that are created
# The class should tell the average number of tenants in a building
# A building should have a placard method that returns the name and address of the building
# A building should have a method returns the average number of tenants per floor

# Then:

class Building
    @@all = []

    attr_accessor :name, :tennants
    attr_reader :address
    

    def initialize(name, address, floors, tennants)
        @name = name
        @address = address
        @floors = floors
        @tennants = tennants
        @@all << self
    end

    def placard
        "This building is called #{name} and it lives at #{address}"
    end

    def average_tennants_per_floor
        "There are about #{tennants/@floors} tennants per floor"
    end

    def self.all
        @@all
    end

    def self.average_tennants_per_building
        total = self.all.reduce(0) { |total,building| total += building.tennants}
        (total / self.all.length.to_f).round
    end
end


# Make objects for the three buildings on this corner. Use a Fermi estimate for the number of tenants.
sad = Building.new("sad house", "123 downcast road", 3, 900)
happy = Building.new("happy house", "235 joy circle", 10, 10)
little = Building.new("little house", "345 small way", 1, 1)


binding.pry