FactoryBot.define do
  factory :post do
    title       { Faker::Lorem.characters(number: 5) }
    content     { Faker::Lorem.paragraph(sentence_count: 5) }
    author      { Faker::Lorem.characters(number: 5) }
    publish     { Faker::Lorem.characters(number: 5) }
    evaluation  { Faker::Number.between(from: 1, to: 5) }

    association :user

    after(:create) do |post|
      create_list(:post_category_relation, 1, post: post, category: create(:category))
    end
  end
end
