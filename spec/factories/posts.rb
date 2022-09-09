FactoryBot.define do
  factory :post do
    title       {'テスト'}
    content     {'テスト'}
    author      {'テスト'}
    publish     {'テスト'}
    evaluation  { 1 }
    association :user
  end
end
