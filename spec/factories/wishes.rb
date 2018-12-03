FactoryBot.define do
  factory :wish do
    description { 'moar coffee' }
    status { 'pending' }
    association :user
  end
end
