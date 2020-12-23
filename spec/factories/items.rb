FactoryBot.define do
  factory :item do
    product_name  {Faker::Name.name}
    text          {Faker::Lorem.sentence}
    category_id   {2}
    status_id     {2}
    burden_id     {2}
    prefecture_id {2}
    shipping_id   {2}
    price         {300}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample0052.jpg'), filename: 'sample0052.jpg')
    end
  end
end