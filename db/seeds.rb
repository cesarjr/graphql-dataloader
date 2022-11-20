# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

City.create([
  { name: 'Rio Branco', state: 'Acre' },
  { name: 'Maceió', state: 'Alagoas' },
  { name: 'Macapá', state: 'Amapá' },
])

Seller.create([
  { name: 'John' },
  { name: 'David' },
  { name: 'Erika' },
])

Person.create([
  {
    name: 'Carl',
    city: City.find_by(name: 'Rio Branco'),
    seller: Seller.find_by(name: 'John')
  },
  {
    name: 'Ashley',
    city: City.find_by(name: 'Maceió'),
    seller: Seller.find_by(name: 'David')
  },
  {
    name: 'Robert',
    city: City.find_by(name: 'Macapá'),
    seller: Seller.find_by(name: 'Erika')
  },
])
