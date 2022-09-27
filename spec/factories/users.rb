FactoryBot.define do
  sequence(:email) { |n| "someguy_#{n}@example.com" }

  factory :user do
    name { "Товарищ № #{rand(999)}" }

    email

    after(:build) { |u| u.password_confirmation = u.password = '123456' }
  end
end
