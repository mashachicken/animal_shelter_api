class Seed

  def self.begin
    seed = Seed.new
    seed.generate_animals
  end

  def generate_animals
    20.times do |i|
      animal = Animal.create!(
        name: Faker::Creature::Cat.name,
        breed: Faker::Creature::Cat.breed
      )
      puts "Animal #{i}: type is #{animal.breed} and their name is '#{animal.name}'."
    end
  end
end

Seed.begin
