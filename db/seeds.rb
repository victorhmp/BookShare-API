# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trade.destroy_all
Offer.destroy_all
Advertisement.destroy_all
WishlistItem.destroy_all
Wishlist.destroy_all
User.destroy_all

victor = User.create!(username: 'VictorHugo', email: 'victor2142@gmail.com', password: 'test123')
kojo = User.create!(username: 'RicardoKojo', email: 'ricardokojo7@gmail.com', password: 'test123')
yurick = User.create!(username: 'YurickHonda', email: 'yurickoficial@gmail.com', password: 'test123')
kaique = User.create!(username: 'KaiqueKomata', email: 'kaique.komata@gmail.com', password: 'test123')

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

wishlist_victor = Wishlist.find(2)
wishlist_kojo = Wishlist.find(6)
wishlist_yurick = Wishlist.find(10)
wishlist_kaique = Wishlist.find(14)
WishlistItem.create!(book_title: 'Apostila Ruby', book_author: 'Gubi', book_publication: 'TecProg II - 2018', wishlist: wishlist_victor)
WishlistItem.create!(book_title: 'Apostila Ruby', book_author: 'Gubi', book_publication: 'TecProg II - 2018', wishlist: wishlist_kaique)
WishlistItem.create!(book_title: 'Apostila Ruby', book_author: 'Gubi', book_publication: 'TecProg II - 2018', wishlist: wishlist_yurick)
WishlistItem.create!(book_title: 'Apostila Ruby', book_author: 'Gubi', book_publication: 'TecProg II - 2018', wishlist: wishlist_kojo)

WishlistItem.create!(book_title: 'Intro to Probability Models', book_author: 'Sheldon Ross', book_publication: '2012', wishlist: wishlist_victor)
WishlistItem.create!(book_title: 'Intro to Probability Models', book_author: 'Sheldon Ross', book_publication: '2012', wishlist: wishlist_kaique)
WishlistItem.create!(book_title: 'Intro to Probability Models', book_author: 'Sheldon Ross', book_publication: '2012', wishlist: wishlist_yurick)
WishlistItem.create!(book_title: 'Intro to Probability Models', book_author: 'Sheldon Ross', book_publication: '2012', wishlist: wishlist_kojo)

WishlistItem.create!(book_title: 'One to Zero', book_author: 'Peter Thiel', book_publication: '2014', wishlist: wishlist_kojo)
WishlistItem.create!(book_title: 'One to Zero', book_author: 'Peter Thiel', book_publication: '2014', wishlist: wishlist_kaique)
WishlistItem.create!(book_title: 'One to Zero', book_author: 'Peter Thiel', book_publication: '2014', wishlist: wishlist_yurick)
WishlistItem.create!(book_title: 'One to Zero', book_author: 'Peter Thiel', book_publication: '2014', wishlist: wishlist_victor)

WishlistItem.create!(book_title: 'The Last Lecture', book_author: 'Randy Pausch', book_publication: '2008', wishlist: wishlist_kojo)
WishlistItem.create!(book_title: 'The Last Lecture', book_author: 'Randy Pausch', book_publication: '2008', wishlist: wishlist_kaique)
WishlistItem.create!(book_title: 'The Last Lecture', book_author: 'Randy Pausch', book_publication: '2008', wishlist: wishlist_victor)
WishlistItem.create!(book_title: 'The Last Lecture', book_author: 'Randy Pausch', book_publication: '2008', wishlist: wishlist_yurick)


Advertisement.create!(user: kaique, book_title:'Um Curso de Cálculo - Volume 3', book_author: 'Hamilton Luiz Guidorizzi', book_publication: '2001', comment: 'Cansei de cálculo, me ajuda ai', status: 0)
Advertisement.create!(user: victor, book_title:'The Last Lecture', book_author: 'Randy Pausch', book_publication: '2008', comment: 'Livro topíssimo', status: 0)
Advertisement.create!(user: kojo, book_title:'Gene', book_author: 'Siddhartha Mukherjee', book_publication: '2016', comment: 'Amazing book!', status: 0)
Advertisement.create!(user: yurick, book_title:'Exemplo', book_author: 'Walt Disney', book_publication: 'Top Man Editora', comment: 'Livro topíssimo', status: 1)

Offer.create(advertisement_id: 1, user: kojo, book_title:'Harry Potter', book_author: 'J.K.Rowling', book_publication: 'Seila', comment: 'Me ajuda, dp ta chegando', status: 2)
Offer.create(advertisement_id: 1, user: victor, book_title:'Game of Thrones', book_author: 'George R.R. Martin', book_publication: 'Leya ou algo assim', comment: 'Não nem pq to ofertando', status: 0)
Offer.create(advertisement_id: 1, user: yurick, book_title:'Bolus', book_author: 'Bolus', book_publication: 'Bolus', comment: 'Só pra deixar na coleção dos Guidorizzi', status: 2)
Offer.create(advertisement_id: 2, user: kojo, book_title:'Exemplo Edição de Luxo', book_author: 'Walt Disney', book_publication: 'Top Man Editora', comment: 'Recomendo, também é muito bom', status: 1)

Trade.create(status:0, advertisement_id:2, offer_id:4)

advertisement = Advertisement.find(2)
advertisement.update!(trade_id: 1)
advertisement.save!
offer = Offer.find(4)
offer.update!(trade_id: 1)
offer.save!