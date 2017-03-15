require 'faker'

FactoryGirl.define do

  factory :team do
    name 'Ruby Development'
  end

  factory :user do
    sequence(:first_name) { Faker::Name.first_name }
    sequence(:last_name) { Faker::Name.unique.last_name }
    sequence(:email) { Faker::Internet.unique.email }
    password 'secretpassword'
    association(:team)
    role :user

    trait :manager do
      role :manager
    end

    trait :admin do
      role :admin
    end
  end

end
