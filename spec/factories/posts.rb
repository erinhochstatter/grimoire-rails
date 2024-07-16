FactoryBot.define do
  factory :post do
    title {Faker::Book.title}
    author {Faker::Book.author}
    kind {["book", "podcast", "article"].sample}
    datePublished {5.years.ago}
    coverImagePath {"https://picsum.photos/200/300"}
    friend
  end
end