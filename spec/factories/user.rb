FactoryGirl.define do
  factory :user do
    name "Jean-Lion"
    password "password"
    sequence :email do |n|
      "person#{n}@example.com"
    end
    
    sequence :login_twitter do |n|
      "jl#{n}"
    end
  end
end
