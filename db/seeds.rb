# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(id: 1, name: 'Rupert', email: 'r@gmail.com', password: '1234567')
User.create(id: 2, name: 'Elisa', email: 'e@gmail.com', password: '1234567')
Category.create(id: 1, name:'Test', author_id: 1, icon: 'icon-bill.png')
Category.create(id: 2, name:'Test', author_id: 2, icon: 'icon-money.png')
Payment.create(author_id: 1, category_id: 1, name:'Test Payment 1', amount: 30)
Payment.create(author_id: 1, category_id: 1, name:'Test Payment 2', amount: 60)
Payment.create(author_id: 2, category_id: 2, name:'Test Payment 3', amount: 30)