FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.first_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '唐津' }
    first_name            { '拓弥' }
    family_kana           { 'カラツ' }
    first_kana            { 'タクヤ' }
    birth_date            { Faker::Date.birthday }
  end
end
