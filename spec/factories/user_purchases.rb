FactoryBot.define do
  factory :user_purchase do
    token                            {'tok_abcdefghijk000000000000000000'}
    postal_code                      {'123-4567'}
    delivery_prefecture_id           { Faker::Number.within(range: 2..48) }
    city                             {'愛上丘岐区'}
    house_number                     {'1-2-3'}
    building_name                    {'アカサタナビル'}
    phone_number                     {'01234567890'}
  end
end
