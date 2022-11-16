# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Customer.destroy_all
Province.destroy_all
AdminUser.destroy_all

if AdminUser.count.nil?
  AdminUser.create(
    :email => 'admin@example.com',
    :password => 'password'
  )
end

require "csv"
csv_file = Rails.root.join("db/salestax.csv")
csv_data = File.read(csv_file)
salestax_csv_data = CSV.parse(csv_data, headers: true)

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

salestax_csv_data.each do |row|
  puts row["code"]
  seed = Province.create(
    name: row["code"],
    PST: row["PST"],
    GST: row["GST"],
    HST: row["HST"]
  )
  rand(1..3).times do
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

Province.all.each do |prov|
 puts "Name: #{prov.name}"
 puts "GST: #{prov.GST}"
 puts "HST: #{prov.HST}"
 puts "PST: #{prov.PST}"
 puts
end



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
#   # endAdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?