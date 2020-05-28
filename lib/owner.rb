class Owner

  @@all = []

  attr_reader :name, :species 

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end 

  def say_species 
    "I am a #{@species}."
  end 

  def self.all
    @@all 
  end 

  def self.count
    @@all.length
  end 

  def self.reset_all 
    @@all.clear
  end 

  def cats
    Cat.all.select{|cats| cats.owner == self}
  end 

  def dogs
    Dog.all.select{|dogs| dogs.owner == self}
  end 

  def buy_cat(name)
    cat_bought = Cat.new(name, self)
  end 

  def buy_dog(name)
    dog_bought = Dog.new(name, self)
  end 

  def walk_dogs 
    self.dogs.each{|dog| dog.mood = "happy"}
  end 

  def feed_cats 
    self.cats.each{|cat| cat.mood = "happy"}
  end 

  def sell_pets 
    self.dogs.each{|dog| dog.mood = "nervous"}
    self.dogs.each{|dog| dog.owner = nil}
    self.cats.each{|cat| cat.mood = "nervous"}
    self.cats.each{|cat| cat.owner = nil}
  end 

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
end