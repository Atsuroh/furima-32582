FactoryBot.define do
  factory :user do
    nickname              { 'atsu' }
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             { '山之内' }
    first_name            { '淳郎' }
    last_name_kana        { 'ヤマノウチ' }
    first_name_kana       { 'アツロウ' }
    birthday              {Faker::Date.birthday(min_age: 0, max_age: 90)}
  end
end