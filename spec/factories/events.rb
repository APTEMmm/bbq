FactoryBot.define do
  factory :event do
    association :user
    title { 'Шашлыки' }
    address { 'Москва' }
    datetime { DateTime.parse('01.01.2023 00:00') }
  end
end
