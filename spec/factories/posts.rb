FactoryBot.define do
  factory :post do
    title       {'テスト'}
    content     {'テスト'}
    author      {'テスト'}
    publish     {'テスト'}
    evaluation  { 1 }

    association :user

    after(:create) do |post| 
      create_list(:post_category_relation,  1, post: post, category: create(:category))
    end
  end
end
