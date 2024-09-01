FactoryBot.define do
  factory :friend do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    avatar_url { 'https://picsum.photos/40/40' }
  end
end
