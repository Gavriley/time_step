require 'faker'

FactoryGirl.define do

  factory :user do
    sequence(:first_name) { Faker::Name.first_name }
    sequence(:last_name) { Faker::Name.unique.last_name }
    sequence(:email) { Faker::Internet.unique.email }
    password 'secretpassword'
    role :user
  end

end
