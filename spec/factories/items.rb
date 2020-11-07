FactoryBot.define do
  factory :item do
    name                                   { Faker::Lorem.word }
    text                                   { Faker::Lorem.sentence }
    category_id                            { Faker::Number.within(range: 2..11) }
    condition_id                           { Faker::Number.within(range: 2..7) }
    delivery_charge_id                     { Faker::Number.within(range: 2..3) }
    delivery_prefecture_id                 { Faker::Number.within(range: 2..48) }
    delivery_day_id                        { Faker::Number.within(range: 2..4) }
    price                                  { Faker::Number.within(range: 300..999999) }
    association :user
  end
end
