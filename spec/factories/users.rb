FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@email.email"}
    password "secret"
  end
end