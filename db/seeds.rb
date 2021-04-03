# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Shelter.create do |shelter|
    shelter.name = Faker::Company.name
    shelter.city = Faker::Address.city
    shelter.foster_program = [true, false].sample
    shelter.rank = rand(1..10)
    20.times do
      shelter.pets.new do |pet|
        pet.name = Faker::Creature::Dog.name
        pet.breed = Faker::Creature::Dog.breed
        pet.age = rand(1..15)
        pet.adoptable = [true, false].sample
      end
    end
  end
  VeterinaryOffice.create do |vet_office|
    vet_office.name = Faker::Games::Pokemon.location
    vet_office.boarding_services = [true, false].sample
    vet_office.max_patient_capacity = rand(50..100)
    20.times do
      vet_office.veterinarians.new do |vet|
        vet.name = Faker::Games::WorldOfWarcraft.hero
        vet.on_call = [true, false].sample
        vet.review_rating = rand(1..10)
      end
    end
  end
end