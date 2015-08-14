Product.destroy_all
Product.create!(name: "Harry Potter", price_in_cents: 1299)
Product.create!(name: "Snow", price_in_cents: 1999)
Product.create!(name: "Game of Thrones", price_in_cents: 2199)

User.destroy_all
User.create!(email: "monica@gmail.com", password: "testing")
User.create!(email: "sam@gmail.com", password: "testing")
