# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

account = Account.create(name: 'Want to watch', user_id: 1)

movie = Movie.create(name: 'Godfather', kind: 'other', account_id: 1)
movie_two = Movie.create(name: 'Titanic', kind: 'other', account_id: 1)

user = User.create(name: 'alina', password_digest: 'password')