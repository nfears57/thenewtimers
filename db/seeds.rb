# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)\# db/seeds.rb
puts 'seeding...'
categories = [
    { name: 'MLB' },
    { name: 'NBA' },
    { name: 'NFL' },
    { name: 'CFB' },
    { name: 'CBB' },
    { name: 'Music' },
    { name: 'Movies' },
    { name: 'TV' },
    { name: 'Lifestyle' },
    { name: 'Misc' }
    # Add more categories here
  ]
  
  categories.each do |category|
    Category.find_or_create_by(name: category[:name])
  end
  
  puts 'Categories seeded successfully'
  
  puts 'seeding again'
  User.create!([{username: "nfears", email: "nfears5798@gmail.com", password: "Njf"}])
  puts "✅ Done seeding!"

  puts 'blogs'
  Blog.create!([
    { title: "Sample Blog 1", content: "blog sample 1", category_id: 10, user_id: 1, comment_count: 5 },
    { title: "Sample Blog 2", content: "blog sample 2", category_id: 10, user_id: 1, comment_count: 10 },
    # Add more blog records here as needed
  ])
  
  puts 'seeded blog'