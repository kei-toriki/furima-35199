FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"123abcd"}
    password_confirmation {"123abcd"}
    birthday              { Faker::Date.backward }
    first_name            {"太郎"}
    last_name             {"田中"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"タナカ"}
  end
end