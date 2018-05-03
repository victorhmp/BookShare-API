# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

List.create(title:"West Sweden Road Trip", excerpt:"A cool road trip with stops in harbors of the coast")
List.create(title:"Must have equipment for the outdoor photographer", excerpt:"My selection of gear for modern outdoor photography")

User.destroy_all
Wishlist.destroy_all

victor = User.create!(username: 'victor', email: 'victor@gmail.com', password: 'test123')
kojo = User.create!(username: 'kojo', email: 'kojo@gmail.com', password: 'test123')
yurick = User.create!(username: 'yurick', email: 'yurick@gmail.com', password: 'test123')
kaique = User.create!(username: 'kaique', email: 'kaique@gmail.com', password: 'test123')

puts "#{User.count} users created!"

# victor's wishlists
Wishlist.create!(user: victor, name: 'JavaScript', description: 'JavaScript books I want to read')
Wishlist.create!(user: victor, name: 'Ruby', description: 'Ruby books I want to read')
Wishlist.create!(user: victor, name: 'C++', description: 'C++ books I want to read')
Wishlist.create!(user: victor, name: 'Python', description: 'Python books I want to read')

# kojo's wishlists
Wishlist.create!(user: kojo, name: 'JavaScript', description: 'JavaScript books I want to read')
Wishlist.create!(user: kojo, name: 'Ruby', description: 'Ruby books I want to read')
Wishlist.create!(user: kojo, name: 'C++', description: 'C++ books I want to read')
Wishlist.create!(user: kojo, name: 'Python', description: 'Python books I want to read')

# yurick's wishlists
Wishlist.create!(user: yurick, name: 'JavaScript', description: 'JavaScript books I want to read')
Wishlist.create!(user: yurick, name: 'Ruby', description: 'Ruby books I want to read')
Wishlist.create!(user: yurick, name: 'C++', description: 'C++ books I want to read')
Wishlist.create!(user: yurick, name: 'Python', description: 'Python books I want to read')

# kaique's wishlists
Wishlist.create!(user: kaique, name: 'JavaScript', description: 'JavaScript books I want to read')
Wishlist.create!(user: kaique, name: 'Ruby', description: 'Ruby books I want to read')
Wishlist.create!(user: kaique, name: 'C++', description: 'C++ books I want to read')
Wishlist.create!(user: kaique, name: 'Python', description: 'Python books I want to read')