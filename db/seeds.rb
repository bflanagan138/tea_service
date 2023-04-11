3.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email
  )
end

3.times do
  Tea.create!(
    title: Faker::Tea.variety,
    description: Faker::Coffee.notes,
    temperature: Faker::Number.number(digits: 3),
    brew_time: Faker::Number.number(digits: 2)
  )
end

Subscription.create!(
  title: "Subscription 1",
  price: 11.88,
  status: "active",
  frequency: "Monthly",
  tea_id: Tea.first.id,
  customer_id: Customer.first.id
)
Subscription.create!(
  title: "Subscription 2",
  price: 22.12,
  status: "cancelled",
  frequency: "Weekly",
  tea_id: Tea.second.id,
  customer_id: Customer.first.id
)
Subscription.create!(
  title: "Subscription 3",
  price: 4.44,
  status: "cancelled",
  frequency: "Yearly",
  tea_id: Tea.first.id,
  customer_id: Customer.last.id
)
Subscription.create!(
  title: "Subscription 4",
  price: 8.88,
  status: "active",
  frequency: "Yearly",
  tea_id: Tea.last.id,
  customer_id: Customer.first.id
)
