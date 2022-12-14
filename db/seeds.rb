# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
unless Rails.env.development?
  puts "[db/seeds.rb] Seed data is being loaded in development mode. not #{Rails.env.production?}"
  exit 0
end

require 'factory_bot'

User.destroy_all
Category.destroy_all
BudgetTransaction.destroy_all

puts "[db/seeds.rb] Seeding data..."
FactoryBot.create_list(:user, 10)
FactoryBot.create_list(:category, 10)
FactoryBot.create_list(:budget_transaction, 10)

Category.all.each do |category|
  category.budget_transactions << BudgetTransaction.all.sample(rand(1..BudgetTransaction.count))
end
puts "[db/seeds.rb] Seeding data...done"