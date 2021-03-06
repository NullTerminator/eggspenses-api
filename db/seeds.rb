p 'POPULATING ASSETS'
unless hens = Asset.find_by(name: 'Laying Hens')
  hens = Asset.create!(name: 'Laying Hens')
  AssetEvent.create!(asset: hens, count: 46, date: Date.parse('2016-11-01'))
end
unless ducks = Asset.find_by(name: 'Ducks')
  ducks = Asset.create!(name: 'Ducks')
  AssetEvent.create!(asset: ducks, count: 9, date: Date.parse('2016-11-01'))
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
  dz_chick = SaleItem.create!(name: 'Dozen Chicken Eggs', price: 4.25, product_count: 12, product: chick_eggs)
end
unless dz_duck = SaleItem.find_by(name: 'Dozen Duck Eggs')
  dz_duck = SaleItem.create!(name: 'Dozen Duck Eggs', price: 4.25, product_count: 12, product: duck_eggs)
end

p 'POPULATING EXPENSES'
feed_pound_price = 25.7 / 50.0
unless Expense.exists?(name: 'Chicken Feed')
  Expense.create!(name: 'Chicken Feed', period: 'daily', price: feed_pound_price * 0.24, expensable: hens, end_date: Date.parse('2017-03-22'))
end
unless Expense.exists?(name: 'Chicken Feed (Extra Winter)')
  Expense.create!(name: 'Chicken Feed (Extra Winter)', period: 'daily', price: feed_pound_price * 0.072, expensable: hens, start_date: Date.parse('2017-02-25'), end_date: Date.parse('2017-04-14'))
end
unless Expense.exists?(name: 'Duck Feed')
  Expense.create!(name: 'Duck Feed', period: 'daily', price: feed_pound_price * 0.4, expensable: ducks)
end

increased_feed_price = 26.85 / 50.0
unless Expense.exists?(name: 'Chicken Feed (17 increase)')
  Expense.create!(name: 'Chicken Feed (17 increase)', period: 'daily', price: increased_feed_price * 0.24, expensable: hens, start_date: Date.parse('2017-03-23'))
end
unless Expense.exists?(name: 'Duck Feed (17 increase)')
  Expense.create!(name: 'Duck Feed (17 increase)', period: 'daily', price: increased_feed_price * 0.4, expensable: ducks, start_date: Date.parse('2017-03-23'))
end

unless Expense.exists?(name: 'Chicken Egg Cartons')
  Expense.create!(name: 'Chicken Egg Cartons', price: 0.25, expensable: dz_chick)
end
unless Expense.exists?(name: 'Duck Egg Cartons')
  Expense.create!(name: 'Duck Egg Cartons', price: 0.25, expensable: dz_duck)
end
