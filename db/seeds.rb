# かんたんログイン用ユーザ
User.create!( 
  name: 'テストユーザ',
  email: 'test0@mail.com',
  introduction: 'よろしくお願いします',
  password: 'password',
  password_confirmation: 'password' )

# その他ユーザ
10.times do |n|
name = Faker::Name.unique.name
email = "test#{n + 1}@mail.com"
introduction = Faker::Lorem.paragraph(sentence_count: 4..8)
password = 'password'

User.create!( 
  name: name,
  email: email,
  introduction: introduction,
  password: password,
  password_confirmation: password )
end

# 投稿
users = User.order(:created_at).take(6)

50.times do
  title = Faker::Lorem.sentence(5)
  caption = Faker::Lorem.sentence(50)
  users.each { |user| user.posts.create!(title: title, caption: caption) }
end
