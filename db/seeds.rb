# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Customer.destroy_all
Province.destroy_all


province_array = [
  'British Columbia',
  'Alberta',
  'Saskatchewan',
  'Manitoba',
  'Ontario',
  'Quebec',
  'Nova Scotia',
  'Newfoundland',
  'New Brunswick',
  'Yukon',
  'Northwest Territories',
  'Nunavut'
]

province_array.each do |p|
  seed = Province.create(
    name: p,
    GST: Faker::Number.decimal,
    PST: Faker::Number.decimal,
    HST: Faker::Number.decimal
  )
  1..3.times do
    customer = Customer.create(
      name: Faker::Name.name,
      address: Faker::Address.street_address,
      username: Faker::Lorem.word,
      password: Faker::Internet.password,
      province: seed
    )
    puts "#{customer.name} from #{seed.name} created"
  end
  # puts seed.inspect
end

# puts Province.all.inspect

Province.all.each do |p|
 puts "Name: #{p.name}"
 puts "GST: #{p.GST}"
 puts "HST: #{p.HST}"
 puts "PST: #{p.PST}"
 puts
end


# 10.times do
#   customer = Customer.create(
#     name: Faker::Name.name,
#     address: Faker::Address.street_address,
#     username: Faker::Lorem.word,
#     password: Faker::Internet.password
#     # province: Province.sample
#   )
#   customer.save
#   customer.province = Province.all.sample

#   puts "#{customer.name} created"
# end

# # traverse the parsed products CSV file
# products.each do |product|
#   # create categories and products
#   new_category_name = Category.find_or_create_by(name: product["category"])
#   new_product = Product.new( title: product["name"],
#                                 price: product["price"],
#                                 description: product["description"],
#                                 stock_quantity: product["stock quantity"].to_i)
#   new_product.category = Category.where(:name => new_category_name.name).first
#   new_product.save
#   # unless(new_product.save)
#   #   new_product.errors.messages.each do |column, errors|
#   #     errors.each do |error|
#   #       puts "The #{column} property #{error}."
#   #     end
#   #   end
#   # end