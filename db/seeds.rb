# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'POPULATING ASSETS'
unless hens = Asset.find_by(name: 'Laying Hens')
  hens = Asset.create!(name: 'Laying Hens', count: 46)
end
unless ducks = Asset.find_by(name: 'Ducks')
  ducks = Asset.create!(name: 'Ducks', count: 9)
end

p 'POPULATING PRODUCTS'
unless chick_eggs = Product.find_by(name: 'Chicken Eggs')
  chick_eggs = Product.create!(name: 'Chicken Eggs', asset: hens)
end
unless duck_eggs = Product.find_by(name: 'Duck Eggs')
  duck_eggs = Product.create!(name: 'Duck Eggs', asset: ducks)
end

p 'POPULATING SALE ITEMS'
unless dz_chick = SaleItem.find_by(name: 'Dozen Chicken Eggs')
  SaleItem.create!(name: 'Dozen Chicken Eggs', price: 4.25, product_count: 12, product: chick_eggs)
end
unless dz_duck = SaleItem.find_by(name: 'Dozen Duck Eggs')
  SaleItem.create!(name: 'Dozen Duck Eggs', price: 4.25, product_count: 12, product: duck_eggs)
end

p 'POPULATING EXPENSES'
unless Expense.exists?(name: 'Chicken Feed')
  Expense.create!(name: 'Chicken Feed', period: 'daily', price: (25.7 / 50) * 0.312, expensable: hens)
end
unless Expense.exists?(name: 'Duck Feed')
  Expense.create!(name: 'Duck Feed', period: 'daily', price: (25.7 / 50) * 0.4, expensable: ducks)
end
unless Expense.exists?(name: 'Chicken Egg Cartons')
  Expense.create!(name: 'Chicken Egg Cartons', price: 0.25, expensable: dz_chick)
end
unless Expense.exists?(name: 'Duck Egg Cartons')
  Expense.create!(name: 'Duck Egg Cartons', price: 0.25, expensable: dz_duck)
end
