User.create!(user_name:  "UserZero",
             email: "userzero@email.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
  name  = Faker::Name.name
  email = "User0#{n+1}@email.com"
  password = "123456"
  User.create!(user_name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name = Faker::Educator.subject
  Category.create!(tag: name)
end
