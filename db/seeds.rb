User.destroy_all
Tree.destroy_all
puts "Destroyed all users and trees"

john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: 'secret')

tree1 = Tree.create!(name: 'John’s apple tree', address: '20 rue des Capucins 69001 Lyon', description: 'This apple tree produces both sweet and sour apples. They will be perfect to cut a little hunger, or enjoy a juicy apple for the dessert.', price_per_year: 175, quantity_per_year: 5, fruit_type: 'Apple', user: john) 

tree2 = Tree.create!(name: 'John’s cherry tree', address: '3 rue Armstrong 78002 Los Angeles', description: 'This cherry tree produces both sweet and sour cherries. They will be perfect to cut a little hunger, or enjoy a juicy cherry for the dessert.', price_per_year: 50, quantity_per_year: 2, fruit_type: 'Cherry', user: john)

tree3 = Tree.create!(name: 'John’s pear tree', address: 'Impasse des Lilas 13000 Marseille', description: 'This pear tree produces both sweet and sour pears. They will be perfect to cut a little hunger, or enjoy a juicy pear for the dessert.', price_per_year: 75, quantity_per_year: 1, fruit_type: 'Pear', user: john)

tree4 = Tree.create!(name: 'John’s plum tree', address: 'Route de genas 2300 Bretagne', description: 'This plum tree produces both sweet and sour plums. They will be perfect to cut a little hunger, or enjoy a juicy plum for the dessert.', price_per_year: 100, quantity_per_year: 3, fruit_type: 'Plum', user: john)

puts "Created #{User.count} users and #{Tree.count} trees"