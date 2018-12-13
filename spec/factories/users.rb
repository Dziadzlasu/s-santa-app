FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    email { 'jdoe@example.com' }
  end
  factory :random_user, class: 'User' do
    first_name { FFaker::NamePL.first_name }
    last_name { FFaker::NamePL.last_name }
    email { FFaker::InternetSE.safe_email }
    password { FFaker::InternetSE.password }
  end
end
