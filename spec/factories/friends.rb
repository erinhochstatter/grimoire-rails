FactoryBot.define do
  factory :friend do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    avatar_url { 'https://picsum.photos/40/40' }

    after(:build, &:regenerate_session_token)
  end
end
