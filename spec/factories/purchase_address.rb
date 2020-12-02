FactoryBot.define do
  factory :purchase_address do
    postcode { '111-1111' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { '東京都' }
    house_number { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
