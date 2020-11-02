FactoryBot.define do
  factory :user do
    nickname              {"加藤"}
    email                 {Faker::Internet.free_email}
    password              {"abc123"}
    password_confirmation {password}
    last_name             {"加藤"}
    first_name            {"投下"}
    last_name_kana        {"カトウ"}
    first_name_kana       {"トウカ"}
    birth_date            {"1992-07-17"}
  end
end