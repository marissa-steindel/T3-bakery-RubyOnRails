require "csv"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Customer.destroy_all
Province.destroy_all
Product.destroy_all
Category.destroy_all
# AdminUser.destroy_all

# if AdminUser.count.nil? || AdminUser.count == 0
#   AdminUser.create(
#     :email => 'admin@example.com',
#     :password => 'password'
#     )
# end

# # salestax_csv_file = Rails.root.join("db/salestax.csv")
# # salestax_csv_data = File.read(csv_file)
# # salestax_csv_data = CSV.parse(csv_data, headers: true)

salestax_csv_data =  CSV.parse(File.read(Rails.root.join("db/salestax.csv")), headers: true)

# salestax_csv_data.each do |row|
#     puts   row["province"]
#     puts   row["code"]
#     puts    row["PST"]
#     puts    row["GST"]
#     puts    row["HST"]
# end

salestax_csv_data.each do |row|
  province = Province.create(
    name:   row["province"],
    code:   row["code"],
    PST:    row["PST"],
    GST:    row["GST"],
    HST:    row["HST"]
  )
  rand(1..3).times do
    customer = Customer.create(
      name: Faker::Name.name,
      address: Faker::Address.street_address,
      username: Faker::Lorem.word,
      password: Faker::Internet.password,
      province: province
    )
    puts "#{customer.name} from #{province.name} created"
  end
  # puts seed.inspect
end

Province.all.each do |prov|
  puts "Name: #{prov.name}"
  puts "GST: #{prov.GST}"
  puts "HST: #{prov.HST}"
  puts "PST: #{prov.PST}"
  puts
end


product_csv_data =  CSV.parse(File.read(Rails.root.join("db/products.csv")), headers: true)

product_csv_data.each do |p|
    # puts p["name"]
    # puts p["price"]
    # puts p["description"]

  new_prod = Product.create(
    name: p["name"],
    price: p["price"].to_i,
    description: p["description"]
  )
end

categories = ["loaf", "sweet", "savoury", "pastry", "cookie", "cake", "muffin", "bun"]

categories.each do |p|
  new_cat = Category.create(name: p)
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
#   # end

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?