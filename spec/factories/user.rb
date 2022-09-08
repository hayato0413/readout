FactoryBot.define do 
  factory :user do 
    id                    { 1 }
    email                 { Faker::Internet.email } #=> "eliza@mann.net"
    password              { "password" }
    password_confirmation { "password" }
    name                  { Faker::Lorem.characters(number: 5) }
    profile               { Faker::Lorem.characters(number: 100) }
  end 
end
