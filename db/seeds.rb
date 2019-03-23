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

20.times do |n|
  name = Faker::Educator.degree
  description = Faker::Lorem.sentence(5)
  tag = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample
  price = [100000, 300000, 500000, 700000, 900000].sample
  Course.create!(name: name,
                 description: description,
                 category_id: tag,
                 price: price)
end
courses = Course.order(:created_at).take(8)
15.times do
  lesson_title = Faker::Educator.course_name
  lesson_content = Faker::Lorem.sentence(5)
  courses.each {|course| course.lessons.create!(lesson_title: lesson_title,
    lesson_content: lesson_content)}
end
