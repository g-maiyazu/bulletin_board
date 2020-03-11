# かんたんログイン用ユーザ
User.create!( 
  name: 'テストユーザ',
  email: 'test0@mail.com',
  introduction: 'テストユーザです',
  password: 'password',
  password_confirmation: 'password' )

# その他ユーザ
10.times do |n|
name = Faker::Name.unique.name
email = "test#{n + 1}@mail.com"
introduction = 'よろしくお願いします'
password = 'password'

User.create!( 
  name: name,
  email: email,
  introduction: introduction,
  password: password,
  password_confirmation: password )
end

# 投稿
users = User.order(:created_at).take(1)

15.times do |n|
  title = "テストタイトル#{n + 1}"
  caption = Faker::Lorem.sentence
  users.each { |user| user.posts.create!(title: title, caption: caption) }
end

# カテゴリー
Category.create!( name: 'ニュース' )
Category.create!( name: '趣味' )
Category.create!( name: '生活' )
Category.create!( name: '食' )
Category.create!( name: 'その他' )