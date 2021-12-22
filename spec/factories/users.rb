FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    date_of_birth         {"1930-01-01"}
    first_name            {"太郎"}
    last_name             {"フリマ"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"フリマ"}
  end
end