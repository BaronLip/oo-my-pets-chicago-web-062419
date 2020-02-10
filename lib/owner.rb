require "pry"

class Owner
	attr_reader :species, :name
	attr_writer 
	attr_accessor :all

	@@all = []
	# @@cats = []
	# @@dogs = []
	
	def initialize(name)
		@name = name
		@species = "human" 
		@@all << self
	end
	
	# Class methods begin.
	def self.all
		@@all
	end

	def self.count
		@@all.count
	end

	def self.reset_all
		@@all = []
	end
	# Class methods end.

	# Instance methods begin.
	def say_species
		"I am a #{self.species}."
	end

	def name
		@name
	end

	def buy_cat(name)
		new_cat = Cat.new(name, self)
	end

	def buy_dog(name)
		new_dog = Dog.new(name, self)
	end

	# This method was tricky cause it wasn't clearly asked for in the tests. 
	def cats
		# Note that you call upon the other class within this class.
		Cat.all.select do |cat|
			cat.owner == self
		end
	end

	# This method was tricky cause it wasn't clearly asked for in the tests. 
	def dogs
		# Note that you call upon the other class within this class.
		Dog.all.select do |dog|
			dog.owner == self
		end
	end

	def walk_dogs
		self.dogs.each do |dog|
			dog.mood = "happy"
		end
	end

	def feed_cats
		self.cats.each do |cat|
			cat.mood = "happy"
		end
	end

	def sell_pets
		pets = []
		pets.push(self.cats)
		pets.push(self.dogs)

		pets.flatten.each do |pet|
			pet.mood = "nervous"
			pet.owner = nil
		end
	end

	def list_pets
		"I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
	end

end

