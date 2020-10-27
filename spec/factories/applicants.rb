FactoryBot.define do
  factory :applicant do
    last_name { Faker::Lorem.characters(number:10) }
    first_name { Faker::Lorem.characters(number:10) }
    last_furigana { Faker::Lorem.characters(number:10) }
    first_furigana { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password '}
  end
end