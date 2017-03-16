namespace :test_data do
  desc "Populate the db with recent data"
  task prepare: :environment do
    Production.destroy_all
    Product.find_each do |product|
      (0..6).each do |i|
        Production.create!(product: product, count: rand(4..36), date: i.days.ago.to_date)
      end
    end
  end

end
