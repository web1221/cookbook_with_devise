# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Rating.destroy_all
rating = Rating.create(difficulty: "easy")
ingredient1 = []
5.times do |i|
  ingredient1.push(Faker::Food.ingredient())
end

20.times do |index|
  rating.recipes.create!(title: Faker::Food.dish,
                        instructions: Faker::Food.description(),
                        ingredients: ingredient1, rating_id: nil)
end

rating2 = Rating.create(difficulty: "medium")
20.times do |index|
  rating2.recipes.create!(title: Faker::Food.dish,
                        instructions: Faker::Food.description(),
                        ingredients: ingredient1, rating_id: nil)
end

rating3 = Rating.create(difficulty: "hard")
20.times do |index|
  rating3.recipes.create!(title: Faker::Food.dish,
                        instructions: Faker::Food.description(),
                        ingredients: ingredient1, rating_id: nil)
end


# 3.times do |index|
#  rating = Rating.create(difficulty: "hard")
#     20.times do |index|
#       rating.recipes.create!(title: Faker::Food.dish,
#         instructions: Faker::Food.description(),
#         ingredients: ingredient1, rating_id: nil)
#       end
#     end
#
#
    p "Created #{Recipe.count} recipes"
