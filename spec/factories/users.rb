FactoryBot.define do
  factory :user do
    name                  { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'm0m0m0' }
    password_confirmation { password }
    first_name            { '正彦' }
    last_name             { '高村' }
    first_name_okurigana  { 'マサヒコ' }
    last_name_okurigana   { 'タカムラ' }
    birthday              { '1989-12-14' }
  end
end
