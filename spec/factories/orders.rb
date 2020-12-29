FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"123-4567"}
    prefecture_id { 2 }
    city {"大阪市"}
    address {"淀川区1-2-3"}
    phone_number {"09012345678"}
    association :user_id, factory: :user
    association :item_id, factory: :item
  end
end