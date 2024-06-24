FactoryBot.define do
  factory :friend do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    kind {["book", "podcast", "article"].sample}
    coverImagePath {"https://picsum.photos/40/40"}
  end
end