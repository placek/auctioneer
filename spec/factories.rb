require 'factory_girl'

FactoryGirl.define do

  sequence :name do |n|
    "testname#{n}"
  end

  sequence :email do |n|
    "testname#{n}@example.com"
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
