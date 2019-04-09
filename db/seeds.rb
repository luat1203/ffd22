User.create!(
  name: "Admin",
  email: "lyld1203@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  activated: true,
  activated_at: Time.zone.now
)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

# Category Seed
Category.create!(
  name: "Category 1",
)

Category.create!(
  name: "Category 2",
  parent_id: 1
)

# Product Seed
7.times do
  Product.create!(
    name: Faker::Lorem.sentence(5),
    price: Faker::Number.between(10, 900),
    information: Faker::Lorem.paragraph(40),
    image: "1.jpg",
    classify: true,
    quantity: Faker::Number.between(1, 90),
    category_id: 1
  )
end

8.times do
  Product.create!(
    name: Faker::Lorem.sentence(5),
    price: Faker::Number.between(10, 900),
    information: Faker::Lorem.paragraph(40),
    image: "2.jpg",
    classify: true,
    quantity: Faker::Number.between(1, 90),
    category_id: 1
  )
end

17.times do
  Product.create!(
    name: Faker::Lorem.sentence(5),
    price: Faker::Number.between(10, 900),
    information: Faker::Lorem.paragraph(40),
    image: "3.png",
    classify: false,
    quantity: Faker::Number.between(1, 90),
    category_id: 2
  )
end
