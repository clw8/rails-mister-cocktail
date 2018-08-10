# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require('open-uri')
require('json')

ingred_url = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read

ingredients_hash = JSON.parse(ingred_url)
ingredients_hash["drinks"].each do |ing|
  Ingredient.create(name: ing["strIngredient1"])
end


Cocktail.create(name: 'Martini', description: "The martini is a cocktail made with gin and vermouth, and garnished with an olive or a lemon twist.", image: "https://www.thecocktaildb.com/images/media/drink/71t8581504353095.jpg")
Dose.create(cocktail_id: 1, ingredient_id: 3, description: "60ml")
Dose.create(cocktail_id: 1, ingredient_id: 107, description: "1 tbsp")
