java_dev = Team.create(name: 'Java Development')

User.create(
  first_name: 'Petro',
  last_name: 'Gavriley',
  email: 'gavrileypetro@gmail.com',
  password: 'qwerty',
  role: :manager,
  team: java_dev
)

3.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.unique.email,
    password: 'qwerty',
    role: :user,
    team: java_dev
  )
end

ruby_dev = Team.create(name: 'Ruby Development')

User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.unique.last_name,
  email: Faker::Internet.unique.email,
  password: 'qwerty',
  role: :manager,
  team: ruby_dev
)

5.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.unique.email,
    password: 'qwerty',
    role: :user,
    team: ruby_dev
  )
end
