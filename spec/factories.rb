require 'factory_girl'

FactoryGirl.define do

  sequence :name do |n|
    "testname#{n}"
  end

  sequence :email do |n|
    "testname#{n}@example.com"
  end

  sequence :description do |n|
    "#{n} lorem ipsum dolor sit amed"
  end

  factory :auction do
    title { FactoryGirl.generate :name }
    description { FactoryGirl.generate :description }
    minimum_price 1500

    factory :public_auction do
      state 'public'
    end
  end

  factory :user do
    email { FactoryGirl.generate :email }
    password 'secret'
    password_confirmation { password }

    factory :confirmed_user do
      confirmed_at { skip_confirmation! && Time.now }
    end
  end

  factory :admin do
    email { FactoryGirl.generate :email }
    password 'secret'
  end
end
